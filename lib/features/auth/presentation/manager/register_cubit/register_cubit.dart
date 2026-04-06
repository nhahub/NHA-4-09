import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserDataRepo userDataRepo;
  final AuthRepo authRepo;
  RegisterCubit({required this.authRepo, required this.userDataRepo})
    : super(RegisterInitialState());

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());

    final Either<Failure, AuthResponse> response = await authRepo.register(
      email: email,
      password: password,
      name: name,
    );
    return response.fold(
      (failure) => emit(RegisterFailureState(message: failure.message)),
      (authResponse) {
        _saveUserData(
          userDataModel: UserDataModel(
            userId: authResponse.user!.id,
            name: name,
            email: authResponse.user!.email,
            createdAt: authResponse.user!.userMetadata!['created_at'],
          ),
        );
        emit(RegisterSuccessState());
      },
    );
  }

  Future<void> _saveUserData({required UserDataModel userDataModel}) async {
    final Either<Failure, UserDataModel> result = await userDataRepo
        .updateUserData(userDataModel: userDataModel);

    return result.fold(
      (failure) {
        return emit(RegisterFailureState(message: failure.message));
      },
      (userData) async {
        return await saveUserDataLocal(userDataModel: userData);
      },
    );
  }
}

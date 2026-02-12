import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/models/user_data_model.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitialState());

  // Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final Either<Failure, void> response = await authRepo.loginWithEmail(
      email: email,
      password: password,
    );

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (_) async {
        final Either<Failure, bool?> oldUserResponse = await authRepo
            .isUserOld();
        oldUserResponse.fold(
          (failure) => emit(LoginFailureState(message: failure.message)),
          (isOldUser) => emit(LoginSuccessState(isOldUser: isOldUser!)),
        );
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingState());

    final Either<Failure, void> response = await authRepo.loginWithGoogle();

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (_) async {
        final Either<Failure, bool?> oldUserResponse = await authRepo
            .isUserOld();
        oldUserResponse.fold(
          (failure) => emit(LoginFailureState(message: failure.message)),
          (isOldUser) {
            if (isOldUser == null) {
              authRepo.saveUserDataRemote(
                userDataModel: UserDataModel(
                  userId: getUser()!.userId,
                  isOldUser: false,
                ),
              );
            }
            emit(LoginSuccessState(isOldUser: isOldUser!));
          },
        );
      },
    );
  }
}

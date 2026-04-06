import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserDataRepo userDataRepo;
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo, required this.userDataRepo})
    : super(LoginInitialState());

  // Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final Either<Failure, AuthResponse> response = await authRepo
        .loginWithEmail(email: email, password: password);

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (response) async {
        final bool success = await _ensureUserLoaded();
        if (!success) return;
        emit(LoginSuccessState(isOldUser: getUser()!.isOldUser));
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingState());

    final Either<Failure, AuthResponse?> response = await authRepo
        .loginWithGoogle();

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (authResponse) async {
        if (authResponse == null) {
          return emit(LoginInitialState());
        } else {
          final Either<Failure, UserDataModel?> result = await userDataRepo
              .updateUserData(
                userDataModel: UserDataModel(
                  userId: authResponse.user!.id,
                  name: authResponse.user!.userMetadata!['full_name'],
                  email: authResponse.user!.email,
                  picture: authResponse.user!.userMetadata!['picture'],
                  createdAt: authResponse.user!.userMetadata!['created_at'],
                ),
              );
          await result.fold(
            (failure) async {
              emit(LoginFailureState(message: failure.message));
            },
            (userData) async {
              await saveUserDataLocal(userDataModel: userData!);
              emit(LoginSuccessState(isOldUser: getUser()!.isOldUser));
            },
          );
        }
      },
    );
  }

  Future<bool> _ensureUserLoaded() async {
    if (getUser() != null) return true;

    final Either<Failure, UserDataModel?> result = await userDataRepo
        .getUserData();

    return await result.fold(
      (failure) async {
        emit(LoginFailureState(message: failure.message));
        return false;
      },
      (userData) async {
        await saveUserDataLocal(userDataModel: userData!);
        return true;
      },
    );
  }
}

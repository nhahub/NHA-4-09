import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/core/functions/user_data_local.dart';

import 'package:moodly/features/auth/data/repos/auth_repo.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserDataRepo userDataRepo;
  final AuthRepo authRepo;

  LoginCubit({required this.authRepo, required this.userDataRepo})
    : super(LoginInitialState());

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final response = await authRepo.loginWithEmail(
      email: email,
      password: password,
    );

    await response.fold(_handleFailure, (_) async {
      final success = await _ensureUserLoaded();
      if (!success) return;

      final user = getUser();
      if (user == null) {
        emit(const LoginFailureState(message: "User not found locally"));
        return;
      }

      await _handleSuccess(user);
    });
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingState());

    final response = await authRepo.loginWithGoogle();

    await response.fold(_handleFailure, (authResponse) async {
      if (authResponse == null) {
        emit(LoginInitialState());
        return;
      }

      await _handleGoogleLogin(authResponse);
    });
  }

  Future<void> _handleGoogleLogin(AuthResponse authResponse) async {
    final existsResponse = await userDataRepo.isUserExists();

    await existsResponse.fold(_handleFailure, (isExists) async {
      final result = isExists
          ? await userDataRepo.getUserData()
          : await _createGoogleUser(authResponse);

      await result.fold(_handleFailure, (userData) async {
        if (userData == null) {
          emit(const LoginFailureState(message: "User data is null"));
          return;
        }

        await _handleSuccess(userData);
      });
    });
  }

  Future<Either<Failure, UserDataModel?>> _createGoogleUser(
    AuthResponse authResponse,
  ) {
    return userDataRepo.updateUserData(
      userDataModel: UserDataModel(
        userId: authResponse.user!.id,
        name: authResponse.user!.userMetadata?['full_name'] ?? '',
        email: authResponse.user!.email ?? '',
        picture: authResponse.user!.userMetadata?['picture'] ?? '',
      ),
    );
  }

  // SHARED LOGIC

  Future<bool> _ensureUserLoaded() async {
    if (getUser() != null) return true;

    final result = await userDataRepo.getUserData();

    return await result.fold(
      (failure) async {
        emit(LoginFailureState(message: failure.message));
        return false;
      },
      (userData) async {
        if (userData == null) {
          emit(const LoginFailureState(message: "User data is null"));
          return false;
        }

        await saveUserDataLocal(userDataModel: userData);
        return true;
      },
    );
  }

  Future<void> _handleSuccess(UserDataModel user) async {
    await saveUserDataLocal(userDataModel: user);

    emit(LoginSuccessState(isOldUser: user.isOldUser));
  }

  Future<void> _handleFailure(Failure failure) async {
    emit(LoginFailureState(message: failure.message));
  }
}

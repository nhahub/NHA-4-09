import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    final Either<Failure, AuthResponse> response = await authRepo
        .loginWithEmail(email: email, password: password);

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (response) {
        return emit(
          LoginSuccessState(
            isOldUser: response.user!.userMetadata!['is_old_user'],
          ),
        );
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingState());

    final Either<Failure, AuthResponse> response = await authRepo.loginWithGoogle();

    return response.fold(
      (failure) => emit(LoginFailureState(message: failure.message)),
      (response) {
        return emit(
          LoginSuccessState(
            isOldUser: response.user!.userMetadata!['is_old_user'],
          ),
        );
      },
    );
  }
}

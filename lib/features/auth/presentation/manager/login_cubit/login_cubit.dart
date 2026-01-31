import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit({required this.authRepo}) : super(LoginInitialState());

  // Login
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    final Either<String, String> response = await authRepo.login(
      email: email,
      password: password,
    );
    return response.fold(
      (failure) => emit(LoginFailureState(message: failure)),
      (userId) => emit(LoginSuccessState(userId: userId)),
    );
  }
}

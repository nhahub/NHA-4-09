import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;

  LoginCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(LoginInitialState());

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final UserDataModel user = await _authRepo.loginWithEmail(
        email: email,
        password: password,
      );
      emit(LoginSuccessState(isOldUser: user.isOldUser));
    } catch (e) {
      emit(
        LoginFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoadingState());

    try {
      final UserDataModel user = await _authRepo.loginWithGoogle();
      emit(LoginSuccessState(isOldUser: user.isOldUser));
    } catch (e) {
      emit(
        LoginFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}

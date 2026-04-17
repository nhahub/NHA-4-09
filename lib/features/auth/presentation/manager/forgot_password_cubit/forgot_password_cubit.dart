import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/repos/auth_repo.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo _authRepo;

  ForgotPasswordCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(ForgotPasswordInitialState());

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoadingState());
    try {
      await _authRepo.forgotPassword(email: email);
      emit(ForgotPasswordSuccessState());
    } catch (e) {
      emit(
        ForgotPasswordFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}

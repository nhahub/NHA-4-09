import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/auth_repo.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo authRepo;

  ForgotPasswordCubit({required this.authRepo})
    : super(ForgotPasswordInitialState());
  // Forgot Password
  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoadingState());

    final Either<String, Unit> response = await authRepo.forgotPassword(
      email: email,
    );
    return response.fold(
      (failure) => emit(ForgotPasswordFailureState(message: failure)),
      (_) => emit(ForgotPasswordSuccessState()),
    );
  }
}

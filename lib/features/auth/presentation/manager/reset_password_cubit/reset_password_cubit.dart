import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/auth_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordCubit({required this.authRepo})
    : super(ResetPasswordInitialState());

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    final Either<String, Unit> response = await authRepo.resetPassword(
      newPassword: newPassword,
    );
    return response.fold(
      (failure) => emit(ResetPasswordFailureState(message: failure)),
      (_) => emit(ResetPasswordSuccessState()),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../profile/data/repos/settings_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SettingsRepo settingsRepo;

  ResetPasswordCubit({required this.settingsRepo})
    : super(ResetPasswordInitialState());

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    final Either<String, Unit> response = await settingsRepo.resetPassword(
      newPassword: newPassword,
    );
    return response.fold(
      (failure) => emit(ResetPasswordFailureState(message: failure)),
      (_) => emit(ResetPasswordSuccessState()),
    );
  }
}

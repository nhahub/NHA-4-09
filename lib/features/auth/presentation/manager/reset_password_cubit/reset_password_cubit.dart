import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../settings/data/repos/settings_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final SettingsRepo _settingsRepo;

  ResetPasswordCubit({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo,
      super(ResetPasswordInitialState());

  Future<void> resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoadingState());
    try {
      await _settingsRepo.resetPassword(newPassword: newPassword);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(
        ResetPasswordFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}

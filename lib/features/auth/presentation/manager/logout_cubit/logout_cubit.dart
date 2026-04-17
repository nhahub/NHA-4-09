import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../settings/data/repos/settings_repo.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SettingsRepo _settingsRepo;

  LogoutCubit({required SettingsRepo settingsRepo})
    : _settingsRepo = settingsRepo,
      super(LogoutInitialState());

  // Logout
  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await _settingsRepo.logout();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(
        LogoutFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}

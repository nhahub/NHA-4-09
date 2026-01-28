import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/profile/data/repos/settings_repo.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SettingsRepo settingsRepo;

  LogoutCubit({required this.settingsRepo}) : super(LogoutInitialState());

  // Logout
  Future<void> logout() async {
    emit(LogoutLoadingState());
    final Either<String, Unit> response = await settingsRepo.logout();
    return response.fold(
      (failure) => emit(LogoutFailureState(message: failure)),
      (_) => emit(LogoutSuccessState()),
    );
  }
}

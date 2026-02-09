import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../profile/data/repos/settings_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final SettingsRepo settingsRepo;

  LogoutCubit({required this.settingsRepo}) : super(LogoutInitialState());

  // Logout
  Future<void> logout() async {
    emit(LogoutLoadingState());
    final Either<Failure, void> response = await settingsRepo.logout();
    return response.fold(
      (failure) => emit(LogoutFailureState(message: failure.message)),
      (_) => emit(LogoutSuccessState()),
    );
  }
}

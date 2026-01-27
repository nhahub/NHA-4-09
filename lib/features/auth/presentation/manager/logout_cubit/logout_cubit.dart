import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/auth_repo.dart';
part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo authRepo;

  LogoutCubit({required this.authRepo}) : super(LogoutInitialState());

  // Logout
  Future<void> logout() async {
    emit(LogoutLoadingState());
    final Either<String, Unit> response = await authRepo.logout();
    return response.fold(
      (failure) => emit(LogoutFailureState(message: failure)),
      (_) => emit(LogoutSuccessState()),
    );
  }
}

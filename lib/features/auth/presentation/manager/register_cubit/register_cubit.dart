import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit({required this.authRepo}) : super(RegisterInitialState());

  // Register
  Future<void> register(String email, String password) async {
    emit(RegisterLoadingState());

    final Either<String, String> response = await authRepo.register(
      email: email,
      password: password,
    );
    return response.fold(
      (failure) => emit(RegisterFailureState(message: failure)),
      (userId) => emit(RegisterSuccessState(userId: userId)),
    );
  }
}

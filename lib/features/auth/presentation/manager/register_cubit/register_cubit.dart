import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit({required this.authRepo}) : super(RegisterInitialState());

  // Register
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());

    final Either<Failure, void> response = await authRepo.register(
      email: email,
      password: password,
      name: name,
    );
    return response.fold(
      (failure) => emit(RegisterFailureState(message: failure.message)),
      (userId) => emit(RegisterSuccessState()),
    );
  }
}

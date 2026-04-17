import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/repos/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;

  RegisterCubit({required AuthRepo authRepo})
    : _authRepo = authRepo,
      super(RegisterInitialState());

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoadingState());
    try {
      await _authRepo.register(email: email, password: password, name: name);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(
        RegisterFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}

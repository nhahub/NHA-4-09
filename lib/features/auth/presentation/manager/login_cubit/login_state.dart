part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final bool isOldUser;
  const LoginSuccessState({required this.isOldUser});

  @override
  List<Object> get props => [isOldUser];
}

final class LoginFailureState extends LoginState {
  final String message;
  const LoginFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

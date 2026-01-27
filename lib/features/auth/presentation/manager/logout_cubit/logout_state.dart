part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitialState extends LogoutState {}

final class LogoutLoadingState extends LogoutState {}

final class LogoutSuccessState extends LogoutState {}

final class LogoutFailureState extends LogoutState {
  final String message;
  const LogoutFailureState({required this.message});
}

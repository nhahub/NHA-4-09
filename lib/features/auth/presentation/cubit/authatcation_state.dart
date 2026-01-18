abstract class AuthatcationState {}

class AuthInitial extends AuthatcationState {}

class AuthLoading extends AuthatcationState {}

class AuthSuccess extends AuthatcationState {
  final String userId;
  AuthSuccess(this.userId);
}

class RegisterSuccess extends AuthatcationState {} // الحالة الجديدة

class AuthFailure extends AuthatcationState {
  final String message;
  AuthFailure(this.message);
}

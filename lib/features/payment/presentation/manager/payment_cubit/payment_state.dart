import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String paymentToken;

  const PaymentSuccess(this.paymentToken);

  @override
  List<Object?> get props => [paymentToken];
}

class PaymentFailure extends PaymentState {
  final String errorMessage;

  const PaymentFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

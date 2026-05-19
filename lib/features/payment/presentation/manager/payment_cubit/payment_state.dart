import 'package:equatable/equatable.dart';

import '../../../data/models/paybal/payment_transaction_model.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentUpdatedState extends PaymentState {
  final int selectedMethodIndex;
  final int selectedSavedCardIndex;

  const PaymentUpdatedState({
    required this.selectedMethodIndex,
    required this.selectedSavedCardIndex,
  });

  @override
  List<Object?> get props => [
    selectedMethodIndex,
    selectedSavedCardIndex,
  ];
}

class PaymentSuccessState extends PaymentState {
  final String paymentToken;

  const PaymentSuccessState({required this.paymentToken});

  @override
  List<Object?> get props => [paymentToken];
}

class PaymentWithPaypalState extends PaymentState {
  final PaymentTransactionModel transactionModel;

  const PaymentWithPaypalState({required this.transactionModel});

  @override
  List<Object?> get props => [transactionModel];
}

class PaymentFailureState extends PaymentState {
  final String errorMessage;

  const PaymentFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

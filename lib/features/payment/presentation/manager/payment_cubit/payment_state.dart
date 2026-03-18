import 'package:equatable/equatable.dart';

import '../../../data/models/card_model.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentUpdatedState extends PaymentState {
  final List<CardModel> savedCards;
  final int selectedMethodIndex;
  final int selectedSavedCardIndex;

  const PaymentUpdatedState({
    required this.savedCards,
    required this.selectedMethodIndex,
    required this.selectedSavedCardIndex,
  });

  @override
  List<Object?> get props => [
    savedCards,
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

class PaymentFailureState extends PaymentState {
  final String errorMessage;

  const PaymentFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

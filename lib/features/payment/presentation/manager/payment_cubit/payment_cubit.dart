import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/billing_data.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/card_model.dart';
import '../../../data/models/stripe/payment_intent_input_model.dart';
import '../../../domain/repos/payment_repo.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;

  List<CardModel> savedCards = [];
  int selectedMethodIndex = -1;
  int selectedSavedCardIndex = -1;

  PaymentCubit({required this.paymentRepo}) : super(PaymentInitialState());

  Future<void> initiatePaymobPayment({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  }) async {
    emit(PaymentLoadingState());

    final result = await paymentRepo.payWithPaymob(
      context: context,
      amount: amount,
      billingData: billingData,
    );

    result.fold(
      (failure) => emit(PaymentFailureState(errorMessage: failure.message)),
      (_) =>
          emit(const PaymentSuccessState(paymentToken: "Payment Successful")),
    );
  }

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoadingState());

    Either<Failure, void> response = await paymentRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    return response.fold(
      (failure) => emit(PaymentFailureState(errorMessage: failure.message)),
      (success) =>
          emit(const PaymentSuccessState(paymentToken: "Payment Successful")),
    );
  }

  void selectMethod(int index) {
    selectedMethodIndex = index;
    selectedSavedCardIndex = -1;
    emit(
      PaymentUpdatedState(
        savedCards: savedCards,
        selectedMethodIndex: selectedMethodIndex,
        selectedSavedCardIndex: selectedSavedCardIndex,
      ),
    );
  }

  void selectCard(int index) {
    selectedMethodIndex = 3;
    selectedSavedCardIndex = index;
    emit(
      PaymentUpdatedState(
        savedCards: savedCards,
        selectedMethodIndex: selectedMethodIndex,
        selectedSavedCardIndex: selectedSavedCardIndex,
      ),
    );
  }

  Future<void> addCard(CardModel card) async {
    savedCards.add(card);
    selectedMethodIndex = 3;
    selectedSavedCardIndex = savedCards.length - 1;

    await paymentRepo.saveCards(savedCards);

    emit(
      PaymentUpdatedState(
        savedCards: savedCards,
        selectedMethodIndex: selectedMethodIndex,
        selectedSavedCardIndex: selectedSavedCardIndex,
      ),
    );
  }

  Future<void> loadSavedCards() async {
    if (savedCards.isNotEmpty) return;

    emit(PaymentLoadingState());

    try {
      savedCards = await paymentRepo.getSavedCards();
      if (savedCards.isNotEmpty && selectedSavedCardIndex == -1) {
        selectedMethodIndex = 3;
        selectedSavedCardIndex = -1;
      }

      emit(
        PaymentUpdatedState(
          savedCards: savedCards,
          selectedMethodIndex: selectedMethodIndex,
          selectedSavedCardIndex: selectedSavedCardIndex,
        ),
      );
    } catch (e) {
      emit(PaymentFailureState(errorMessage: e.toString()));
    }
  }
}

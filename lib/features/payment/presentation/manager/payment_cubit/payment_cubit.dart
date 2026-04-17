import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/billing_data.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../../therapist/data/repos/booking_repo.dart';
import '../../../data/models/card_model.dart';
import '../../../data/models/paybal/payment_transaction_model.dart';
import '../../../data/models/stripe/payment_intent_input_model.dart';
import '../../../data/repos/subscription_repo.dart';
import '../../../domain/repos/payment_repo.dart';
import '../../helpers/paypal_transaction_builder.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final BookingRepo _bookingRepo;
  final PaymentRepo _paymentRepo;
  final SubscriptionRepo _subscriptionRepo;

  final double price;
  final String? type;
  final String? sessionType;
  final BookingTherapist? therapist;
  final BookingSlot? slot;

  List<CardModel> savedCards = [];
  int selectedMethodIndex = -1;
  int selectedSavedCardIndex = -1;

  PaymentCubit({
    required PaymentRepo paymentRepo,
    required SubscriptionRepo subscriptionRepo,
    required BookingRepo bookingRepo,
    required this.price,
    this.type,
    this.sessionType,
    this.slot,
    this.therapist,
  }) : _paymentRepo = paymentRepo,
       _subscriptionRepo = subscriptionRepo,
       _bookingRepo = bookingRepo,
       super(PaymentInitialState());

  Future<void> payWithPaymob({
    required BuildContext context,
    required BillingData billingData,
  }) async {
    emit(PaymentLoadingState());

    try {
      await _paymentRepo.payWithPaymob(
        context: context,
        amount: price,
        billingData: billingData,
      );
      await handlePostPayment();
    } catch (e) {
      emit(
        PaymentFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> payWithStripe() async {
    emit(PaymentLoadingState());

    try {
      await _paymentRepo.payWithStripe(
        paymentIntentInputModel: PaymentIntentInputModel(
          amount: (price * 100).round().toString(),
          currency: 'USD',
          customerId: "cus_UAAmigSz69OFAr",
        ),
      );
      await handlePostPayment();
    } catch (e) {
      emit(
        PaymentFailureState(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<PaymentTransactionModel> payWithPaypal() async {
    emit(PaymentLoadingState());

    try {
      final transaction = buildPaypalTransaction(price: price);
      emit(PaymentWithPaypalState(transactionModel: transaction));
      return transaction;
    } catch (e) {
      emit(PaymentFailureState(errorMessage: e.toString()));
      rethrow;
    }
  }

  Future<void> handlePostPayment() async {
    if (type != null) {
      await _subscriptionRepo.createSubscription(type: type!);
    } else {
      await _bookingRepo.bookingSession(
        therapist: therapist!,
        slot: slot!,
        sessionType: sessionType!,
        price: price,
      );
    }
    emit(const PaymentSuccessState(paymentToken: "Payment Successful"));
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

    await _paymentRepo.saveCards(savedCards);

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
      savedCards = await _paymentRepo.getSavedCards();
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

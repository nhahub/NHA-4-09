import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:flutter_paymob/paymob_response.dart';

import '../../domain/repos/payment_repo.dart';
import '../models/card_model.dart';
import '../models/stripe/create_customer_input_model.dart';
import '../models/stripe/payment_intent_input_model.dart';
import '../models/stripe/stripe_customer_model/stripe_customer_model.dart';
import '../services/cards_local_service.dart';
import '../services/paymob_service.dart';
import '../services/stripe_service.dart';

class PaymentRepoImp extends PaymentRepo {
  final CardsLocalService local;
  final StripeService stripeService;
  final PaymobService paymobService;

  PaymentRepoImp({
    required this.stripeService,
    required this.paymobService,
    required this.local,
  });

  @override
  Future<void> payWithStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    await stripeService.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }

  @override
  Future<StripeCustomerModel> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  }) async {
    final StripeCustomerModel response = await stripeService.createCustomer(
      createCustomerInputModel: createCustomerInputModel,
    );
    return response;
  }

  @override
  Future<List<CardModel>> getSavedCards() {
    return local.getSavedCards();
  }

  @override
  Future<void> saveCards(List<CardModel> cards) {
    return local.saveCards(cards);
  }

  @override
  Future<PaymentPaymobResponse> payWithPaymob({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  }) async {
    final completer = Completer<PaymentPaymobResponse>();

    await paymobService.payWithCard(
      context: context,
      amount: amount,
      billingData: billingData,
      onPayment: (result) {
        if (result.success == true) {
          completer.complete(result);
        } else if (result.success == false) {
          completer.complete(
            throw Exception(result.message ?? "Payment Failed"),
          );
        }
      },
    );
    return completer.future;
  }
}

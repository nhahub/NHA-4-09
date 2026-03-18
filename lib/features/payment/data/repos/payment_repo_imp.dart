import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:flutter_paymob/paymob_response.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
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
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on StripeException catch (e) {
      final String msg = e.error.message ?? "Payment failed. Please try again.";
      return left(ApiErrorModel(message: msg));
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  @override
  Future<Either<Failure, StripeCustomerModel>> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  }) async {
    try {
      final StripeCustomerModel response = await stripeService.createCustomer(
        createCustomerInputModel: createCustomerInputModel,
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
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
  Future<Either<Failure, PaymentPaymobResponse>> payWithPaymob({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
  }) async {
    final completer = Completer<Either<Failure, PaymentPaymobResponse>>();

    try {
      await paymobService.payWithCard(
        context: context,
        amount: amount,
        billingData: billingData,
        onPayment: (result) {
          if (result.success == true) {
            completer.complete(right(result));
          } else if (result.success == false) {
            completer.complete(
              left(
                ApiErrorHandler.handle(
                  error: Exception(result.message ?? "Payment Failed"),
                ),
              ),
            );
          }
        },
      );

      return completer.future;
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

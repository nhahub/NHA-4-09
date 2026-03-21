import 'package:flutter/material.dart';
import 'paypal_transaction_builder.dart';
import '../../../../core/functions/build_snack_bar.dart';
import '../../data/models/card_model.dart';
import 'execute_paymob_payment.dart';
import 'execute_paypal_payment.dart';
import 'execute_stripe_payment.dart';

class PaymentHandler {
  static void handle({
    required BuildContext context,
    required double price,
    required String type,
    required int selectedMethodIndex,
    required CardModel? currentCard,
  }) {
    if (selectedMethodIndex == 3 && currentCard == null) {
      warningSnackBar(
        context: context,
        message: "Please select or add a card first",
      );
      return;
    }

    switch (selectedMethodIndex) {
      case 0:
        executePayPalPayment(
          context: context,
          paymentTransactionModel: buildPaypalTransaction(
            price: price,
            type: type,
          ),
          type: type,
        );
        break;

      case 1:
        executeStripePayment(context: context, price: price, type: type);
        break;

      case 2:
        executePaymobPayment(
          context: context,
          currentCard: currentCard,
          price: price,
          type: type,
        );
        break;
    }
  }
}

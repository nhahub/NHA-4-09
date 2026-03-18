import 'package:flutter/material.dart';
import '../../../../core/functions/build_snack_bar.dart';
import '../../data/models/card_model.dart';
import '../../data/models/paybal/payment_transaction_model.dart';
import '../../data/models/payment_transaction_mock.dart';
import 'execute_paymob_payment.dart';
import 'execute_paypal_payment.dart';
import 'execute_stripe_payment.dart';

class PaymentHandler {
  static void handle({
    required BuildContext context,
    required double price,
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
        final mock = PaymentTransactionMock.mockPaymentTransactionModel;

        executePayPalPayment(
          context: context,
          paymentTransactionModel: PaymentTransactionModel(
            amount: mock.amount,
            description: "Subscribe",
            itemList: mock.itemList,
          ),
        );
        break;

      case 1:
        executeStripePayment(context: context, price: price);
        break;

      case 2:
        executePaymobPayment(
          context: context,
          currentCard: currentCard,
          price: price,
        );
        break;
    }
  }
}

import 'package:flutter/material.dart';

import '../../../../core/functions/build_snack_bar.dart';
import '../../data/models/card_model.dart';
import '../../data/models/paybal/payment_transaction_model.dart';
import '../manager/payment_cubit/payment_cubit.dart';
import 'execute_paymob_payment.dart';
import 'execute_paypal_payment.dart';
import 'execute_stripe_payment.dart';

class PaymentHandler {
  static void handle({
    required BuildContext context,
    required int selectedMethodIndex,
    required CardModel? currentCard,
    required PaymentCubit cubit,
  }) async {
    if (selectedMethodIndex == 3 && currentCard == null) {
      warningSnackBar(
        context: context,
        message: "Please select or add a card first",
      );
      return;
    }

    switch (selectedMethodIndex) {
      case 0:
        final PaymentTransactionModel transaction = await cubit.payWithPaypal();
        if (context.mounted) {
          executePayPalPayment(
            context: context,
            paymentTransactionModel: transaction,
            cubit: cubit,
          );
        }
        break;

      case 1:
        executeStripePayment(context: context);
        break;

      case 2:
        executePaymobPayment(context: context, currentCard: currentCard);
        break;
    }
  }
}

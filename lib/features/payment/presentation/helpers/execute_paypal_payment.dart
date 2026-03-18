import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/paybal/payment_transaction_model.dart';

void executePayPalPayment({
  required BuildContext context,
  required PaymentTransactionModel paymentTransactionModel,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": paymentTransactionModel.amount.toJson(),
            "description": paymentTransactionModel.description,
            "item_list": paymentTransactionModel.itemList.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Logger.log("onSuccess: $params");

          Navigator.of(context).pushNamedAndRemoveUntil(Routes.thankYouView, (
            route,
          ) {
            if (route.settings.name == "/") {
              return true;
            } else {
              return false;
            }
          });
        },
        onError: (error) {
          Logger.log("onError: $error");
          context.pop();
        },
        onCancel: () {
          Logger.log('cancelled:');
          context.pop();
        },
      ),
    ),
  );
}

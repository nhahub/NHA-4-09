import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:moodly/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import '../../../../core/constants/app_keys.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/confirm_dialog.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/paybal/payment_transaction_model.dart';

void executePayPalPayment({
  required BuildContext context,
  required PaymentTransactionModel paymentTransactionModel,
  required PaymentCubit cubit,
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
          await cubit.handlePostPayment();
          if (context.mounted) {
            confirmDialog(
              context: context,
              title: "Payment Successful",
              message:
                  "Your payment was successful. Thank you for your support!",
              onConfirm: () => context.pushAndRemoveUntil(Routes.mainView),
            );
          }
        },
        onError: (error) {
          context.pop();
        },
        onCancel: () {
          context.pop();
        },
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/billing_data.dart';
import '../../data/models/card_model.dart';
import '../manager/payment_cubit/payment_cubit.dart';

void executePaymobPayment({
  required BuildContext context,
  required double price,
  required String type,
  required CardModel? currentCard,
}) {
  context.read<PaymentCubit>().initiatePaymobPayment(
    context: context,
    amount: price,
    billingData: BillingData(
      firstName: currentCard?.holderName.split(" ").first ?? "User",
      lastName: currentCard?.holderName.contains(" ") == true
          ? currentCard!.holderName.split(" ").last
          : "Name",
      email: "user@example.com",
      phoneNumber: "+201234567890",
    ),
    type: type,
  );
}

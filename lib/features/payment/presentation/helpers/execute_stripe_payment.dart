import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/stripe/payment_intent_input_model.dart';
import '../manager/payment_cubit/payment_cubit.dart';

void executeStripePayment({
  required BuildContext context,
  required double price,
}) {
  int amount = (price * 100).round();
  context.read<PaymentCubit>().makePayment(
    paymentIntentInputModel: PaymentIntentInputModel(
      amount: amount.toString(),
      currency: 'USD',
      customerId: "cus_UAAmigSz69OFAr",
    ),
  );
}

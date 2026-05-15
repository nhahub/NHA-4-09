import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/billing_data.dart';

import '../manager/payment_cubit/payment_cubit.dart';

void executePaymobPayment({
  required BuildContext context,
}) {
  context.read<PaymentCubit>().payWithPaymob(
    context: context,
    billingData: BillingData(
      email: "user@example.com",
      phoneNumber: "+201234567890",
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/payment_cubit/payment_cubit.dart';

void executeStripePayment({required BuildContext context}) {
  context.read<PaymentCubit>().payWithStripe();
}

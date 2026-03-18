import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/confirm_dialog.dart';
import 'loading_overlay.dart';
import 'subscribe_button.dart';
import 'subscribe_content.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/payment_cubit/payment_cubit.dart';
import '../../manager/payment_cubit/payment_state.dart';

class SubscribeViewBody extends StatelessWidget {
  final double price;
  const SubscribeViewBody({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: _listener,
      builder: (context, state) {
        return Stack(
          children: [
            SubscribeContent(price: price, state: state),

            if (state is PaymentLoadingState) const LoadingOverlay(),

            SubscribeButton(price: price, state: state),
          ],
        );
      },
    );
  }

  void _listener(BuildContext context, PaymentState state) {
    if (state is PaymentSuccessState) {
      confirmDialog(
        context: context,
        title: "Payment Successful",
        message: "Your payment was successful. Thank you for your support!",
        onConfirm: () => context.pushAndRemoveUntil(Routes.mainView),
      );
    } else if (state is PaymentFailureState) {
      errorDialog(context: context, message: state.errorMessage);
    }
  }
}

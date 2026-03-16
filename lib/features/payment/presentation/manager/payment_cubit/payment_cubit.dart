import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> initiatePayment({
    required BuildContext context,
    required double amount,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    emit(PaymentLoading());

    try {
      // Trigger payment using payWithCard for version 1.0.8
      FlutterPaymob.instance.payWithCard(
        context: context,
        currency: "EGP",
        amount: amount,
        onPayment: (response) {
          if (response.success) {
            emit(const PaymentSuccess("Payment Successful"));
          } else {
            emit(PaymentFailure(response.message ?? "Payment Failed"));
          }
        },
      );
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }
}

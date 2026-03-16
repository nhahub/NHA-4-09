import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../models/stripe/create_customer_input_model.dart';
import '../models/stripe/payment_intent_input_model.dart';
import '../models/stripe/stripe_customer_model/stripe_customer_model.dart';
import '../services/stripe_service.dart';
import 'checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService;
  CheckoutRepoImp({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on StripeException catch (e) {
      final String msg = e.error.message ?? "Payment failed. Please try again.";
      return left(ApiErrorModel(message: msg));
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  @override
  Future<Either<Failure, StripeCustomerModel>> createCustomer({
    required CreateCustomerInputModel createCustomerInputModel,
  }) async {
    try {
      final StripeCustomerModel response = await stripeService.createCustomer(
        createCustomerInputModel: createCustomerInputModel,
      );
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

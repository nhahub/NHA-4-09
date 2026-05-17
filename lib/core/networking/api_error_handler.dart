import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../errors/auth_error.dart';
import '../errors/database_error.dart';
import '../errors/dio_error_handler.dart';
import '../errors/network_error.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle({required dynamic error}) {
    if (error is DioException) {
      return DioErrorHandler.handle(error);
    } else if (error is SocketException ||
        error is AuthRetryableFetchException) {
      return NetworkError().handle();
    } else if (error is AuthApiException || error is AuthException) {
      return AuthError(error).handle();
    } else if (error is PostgrestException) {
      return DatabaseError(error).handle();
    } else if (error is StateError) {
      return ApiErrorModel(message: 'Please select an account again.');
    } else if (error is StripeException) {
      return ApiErrorModel(
        message: error.error.message ?? "Payment failed. Please try again.",
      );
    } else {
      return ApiErrorModel(message: 'Unknown error: ${error.toString()}');
    }
  }
}

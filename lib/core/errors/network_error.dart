import 'dart:io';
import 'package:moodly/core/networking/api_error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NetworkError {
  final dynamic error;

  NetworkError(this.error);

  ApiErrorModel handle() {
    if (error is SocketException ||
        (error is AuthRetryableFetchException &&
            error.toString().toLowerCase().contains('network'))) {
      return ApiErrorModel(
        message: 'Please check your internet connection and try again.',
      );
    }
    return ApiErrorModel(message: error.toString());
  }
}

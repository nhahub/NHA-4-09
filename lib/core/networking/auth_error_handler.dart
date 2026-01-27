import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthErrorHandler {
  static String map({required dynamic error}) {
    // Direct socket error
    if (error is SocketException) {
      return 'Please check your internet connection and try again.';
    }

    // Supabase retryable network error
    if (error is AuthRetryableFetchException) {
      final message = error.message.toLowerCase();

      if (message.contains('socketexception') ||
          message.contains('failed host lookup') ||
          message.contains('network') ||
          message.contains('connection')) {
        return 'Please check your internet connection and try again.';
      }
    }

    // Supabase auth errors
    if (error is AuthApiException) {
      switch (error.code) {
        case 'invalid_credentials':
          return 'Invalid email or password.';
        case 'email_not_confirmed':
          return 'Please verify your email address first.';
        default:
          return error.message;
      }
    }

    // Generic network text fallback
    final msg = error.toString().toLowerCase();
    if (msg.contains('socket') ||
        msg.contains('host lookup') ||
        msg.contains('network')) {
      return 'Please check your internet connection and try again.';
    }

    // Final fallback
    return 'Something went wrong. Please try again.';
  }
}

import '../networking/api_error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthError {
  final dynamic error;

  AuthError(this.error);

  ApiErrorModel handle() {
    if (error is AuthApiException) {
      final code = error.code ?? '';
      final message = error.message;

      switch (code) {
        case 'invalid_credentials':
          return ApiErrorModel(message: 'Invalid email or password.');
        case 'email_not_confirmed':
          return ApiErrorModel(message: 'Your email is not confirmed.');
        case 'user_not_found':
          return ApiErrorModel(message: 'User does not exist.');
        case 'weak_password':
          return ApiErrorModel(message: 'Password is too weak.');
        case 'too_many_enrolled_mfa_factors':
        case 'over_request_rate_limit':
          return ApiErrorModel(message: 'Too many requests. Try later.');
        case 'session_expired':
          return ApiErrorModel(
            message: 'Session expired. Please log in again.',
          );
        case 'user_banned':
          return ApiErrorModel(message: 'Your account is banned.');
        default:
          return ApiErrorModel(message: message);
      }
    } else if (error is AuthException) {
      return ApiErrorModel(message: error.message);
    } else if (error is AuthRetryableFetchException) {
      final msg = error.message.toLowerCase();
      if (msg.contains('socketexception') ||
          msg.contains('failed host lookup')) {
        return ApiErrorModel(message: 'Please check your internet connection.');
      }
    }
    return ApiErrorModel(message: 'Unknown Auth error: ${error.toString()}');
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

import '../networking/api_error_model.dart';

class DatabaseError {
  final PostgrestException error;

  DatabaseError(this.error);

  ApiErrorModel handle() {
    final code = error.code ?? '';
    final message = error.message;

    switch (code) {
      case "400":
        return ApiErrorModel(message: 'Bad request: $message');
      case "401":
        return ApiErrorModel(message: 'Unauthorized: $message');
      case "403":
        return ApiErrorModel(message: 'Forbidden: $message');
      case "404":
        return ApiErrorModel(message: 'Not found: $message');
      case "409":
        return ApiErrorModel(message: 'Conflict: $message');
      case "422":
        return ApiErrorModel(message: 'Unprocessable: $message');
      case "429":
        return ApiErrorModel(message: 'Too many requests. Please slow down.');
      case "500":
      case "501":
        return ApiErrorModel(message: 'Server error: $message');
      default:
        return ApiErrorModel(message: 'Unexpected error: $message');
    }
  }
}

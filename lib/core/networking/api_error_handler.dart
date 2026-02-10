import 'dart:io';
import '../errors/database_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../errors/auth_error.dart';
import '../errors/network_error.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle({required dynamic error}) {
    if (error is SocketException || error is AuthRetryableFetchException) {
      return NetworkError(error).handle();
    } else if (error is AuthApiException || error is AuthException) {
      return AuthError(error).handle();
    } else if (error is PostgrestException) {
      return DatabaseError(error).handle();
    } else {
      return ApiErrorModel(message: 'Unknown error: ${error.toString()}');
    }
  }
}

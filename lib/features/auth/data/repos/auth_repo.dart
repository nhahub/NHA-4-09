import 'package:dartz/dartz.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  AuthRepo({required this.supabaseAuthService});

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseAuthService.login(
        email: email,
        password: password,
      );
      return right(response.user!.id);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, String>> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseAuthService.register(
        email: email,
        password: password,
      );
      if (response.user != null) {
        await supabaseAuthService.logout();
      }
      return right(response.user!.id);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await supabaseAuthService.forgotPassword(email: email);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/networking/auth_error_handler.dart';
import '../../../../core/services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  AuthRepo({required this.supabaseAuthService});

  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseAuthService.login(
        email: email,
        password: password,
      );
      return Right(response.user!.id);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.handle(error: e));
    }
  }

  Future<Either<String, String>> register({
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
      return Right(response.user!.id);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.handle(error: e));
    }
  }

  Future<Either<String, Unit>> forgotPassword({required String email}) async {
    try {
      await supabaseAuthService.forgotPassword(email: email);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.handle(error: e));
    }
  }
}

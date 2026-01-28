import 'package:dartz/dartz.dart';

import '../../../../core/networking/auth_error_handler.dart';
import '../../../../core/networking/supabase_service.dart';

class AuthRepo {
  final SupabaseService supabaseService;

  AuthRepo({required this.supabaseService});

  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseService.login(
        email: email,
        password: password,
      );
      return Right(response.user!.id);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.map(error: e));
    }
  }

  Future<Either<String, String>> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseService.register(
        email: email,
        password: password,
      );
      if (response.user != null) {
        await supabaseService.logout();
      }
      return Right(response.user!.id);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.map(error: e));
    }
  }

  Future<Either<String, Unit>> forgotPassword({required String email}) async {
    try {
      await supabaseService.forgotPassword(email: email);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.map(error: e));
    }
  }
}

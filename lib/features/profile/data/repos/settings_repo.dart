import 'package:dartz/dartz.dart';

import '../../../../core/networking/auth_error_handler.dart';
import '../../../../core/services/supabase_auth_service.dart';

class SettingsRepo {
  final SupabaseAuthService supabaseAuthService;

  SettingsRepo({required this.supabaseAuthService});

  Future<Either<String, Unit>> logout() async {
    try {
      await supabaseAuthService.logout();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.handle(error: e));
    }
  }

  Future<Either<String, Unit>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await supabaseAuthService.resetPassword(newPassword: newPassword);
      await supabaseAuthService.logout();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.handle(error: e));
    }
  }
}

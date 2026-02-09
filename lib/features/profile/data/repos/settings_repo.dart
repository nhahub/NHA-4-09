import 'package:dartz/dartz.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/supabase_auth_service.dart';

class SettingsRepo {
  final SupabaseAuthService supabaseAuthService;

  SettingsRepo({required this.supabaseAuthService});

  Future<Either<Failure, void>> logout() async {
    try {
      await supabaseAuthService.logout();
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await supabaseAuthService.resetPassword(newPassword: newPassword);
      await supabaseAuthService.logout();
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

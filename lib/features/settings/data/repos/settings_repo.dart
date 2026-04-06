import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../auth/data/services/supabase_auth_service.dart';

class SettingsRepo {
  final SupabaseAuthService supabaseAuthService;

  SettingsRepo({required this.supabaseAuthService});

  Future<Either<Failure, void>> logout() async {
    try {
      await supabaseAuthService.logout();
      await removeUserDataLocal();
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await supabaseAuthService.updateUserProfile(password: newPassword);
      await supabaseAuthService.logout();
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

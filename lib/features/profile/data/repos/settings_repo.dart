import 'package:dartz/dartz.dart';

import '../../../../core/networking/auth_error_handler.dart';
import '../../../../core/networking/supabase_service.dart';

class SettingsRepo {
  final SupabaseService supabaseService;

  SettingsRepo({required this.supabaseService});

  Future<Either<String, Unit>> logout() async {
    try {
      await supabaseService.logout();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.map(error: e));
    }
  }

  Future<Either<String, Unit>> resetPassword({
    required String newPassword,
  }) async {
    try {
      await supabaseService.resetPassword(newPassword: newPassword);
      await supabaseService.logout();
      return const Right(unit);
    } on Exception catch (e) {
      return Left(AuthErrorHandler.map(error: e));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
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

  Future<Either<Failure, UserResponse>> updateUserProfile({
    String? email,
    String? phone,
    String? password,
    String? name,
    String? image,
    bool? isOldUser,
  }) async {
    try {
      final UserResponse userResponse = await supabaseAuthService
          .updateUserProfile(
            email: email,
            phone: phone,
            password: password,
            data: {"name": name, "is_old_user": isOldUser, "image": image},
          );
      return right(userResponse);
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

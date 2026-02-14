import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService supabaseAuthService;

  AuthRepo({required this.supabaseAuthService});

  Future<Either<Failure, AuthResponse>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseAuthService.loginWithEmail(
        email: email,
        password: password,
      );
      if (getUser() == null) {
        await saveUserDataLocal(
          userDataModel: UserDataModel(
            userId: response.user!.id,
            email: response.user!.email,
            name: response.user!.userMetadata!['name'],
            isOldUser: response.user!.userMetadata!['is_old_user'],
          ),
        );
      }
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, AuthResponse?>> loginWithGoogle() async {
    try {
      final AuthResponse? response = await supabaseAuthService
          .loginWithGoogle();
      if (getUser() == null && response != null) {
        await saveUserDataLocal(
          userDataModel: UserDataModel(
            userId: response.user!.id,
            email: response.user!.email,
            name: response.user!.userMetadata!['full_name'],
            isOldUser: response.user!.userMetadata!['is_old_user'],
          ),
        );
      }
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseAuthService.register(
        name: name,
        email: email,
        password: password,
      );
      await saveUserDataLocal(
        userDataModel: UserDataModel(
          userId: response.user!.id,
          email: response.user!.email,
          name: response.user!.userMetadata!['name'],
          isOldUser: response.user!.userMetadata!['is_old_user'],
        ),
      );
      return right(null);
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

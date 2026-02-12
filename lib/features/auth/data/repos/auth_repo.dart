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

  Future<Either<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseAuthService.login(
        email: email,
        password: password,
      );
      if (getUser() == null) {
        await saveUser(userDataModel: UserDataModel(userId: response.user!.id));
      }
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> register({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseAuthService.register(
        email: email,
        password: password,
      );
      await saveUser(userDataModel: UserDataModel(userId: response.user!.id));
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

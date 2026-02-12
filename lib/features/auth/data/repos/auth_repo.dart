import 'package:dartz/dartz.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/services/supabase_auth_service.dart';

class AuthRepo {
  final SupabaseAuthService supabaseAuthService;
  final SupabaseCRUDService supabaseCRUDService;

  AuthRepo({
    required this.supabaseAuthService,
    required this.supabaseCRUDService,
  });

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
      Logger.log(e.toString());
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
      await saveUserDataRemote(
        userDataModel: UserDataModel(
          userId: response.user!.id,
          isOldUser: false,
        ),
      );
      await saveUser(userDataModel: UserDataModel(userId: response.user!.id));
      return right(null);
    } catch (e) {
      Logger.log(e.toString());
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

  Future<Either<Failure, void>> saveUserDataRemote({
    required UserDataModel userDataModel,
  }) async {
    try {
      await supabaseCRUDService.addData(
        table: kProfilesTable,
        data: userDataModel.toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, bool>> isUserOld() async {
    try {
      Map<String, dynamic>? currentUser = await supabaseCRUDService
          .getSingleRow(
            table: kProfilesTable,
            whereColumn: 'id',
            whereValue: getUser()!.userId,
          );
      UserDataModel userDataModel = UserDataModel.fromJson(currentUser!);
      return right(userDataModel.isOldUser!);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

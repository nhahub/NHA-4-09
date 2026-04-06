import 'package:dartz/dartz.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/auth/data/services/user_data_service.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/user_data_model.dart';

class UserDataRepo {
  UserDataService userDataService;
  UserDataRepo({required this.userDataService});

  Future<Either<Failure, UserDataModel>> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    try {
      final UserDataModel response = await userDataService.updateUserData(
        userDataModel: userDataModel,
      );
      saveUserDataLocal(userDataModel: userDataModel);
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, UserDataModel?>> getUserData() async {
    try {
      final UserDataModel? response = await userDataService.getUserData();
      return right(response);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}

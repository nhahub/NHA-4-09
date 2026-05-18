import '../../../../core/functions/user_data_local.dart';
import '../../../../core/models/user_data_model.dart';
import '../services/user_data_service.dart';

class UserDataRepo {
  final UserDataService _userDataService;
  UserDataRepo({required UserDataService userDataService})
    : _userDataService = userDataService;

  Future<bool> isUserExists() async {
    final bool response = await _userDataService.isUserExists();
    return response;
  }

  Future<UserDataModel> updateUserData({
    required UserDataModel userDataModel,
  }) async {
    final UserDataModel response = await _userDataService.updateUserData(
      userDataModel: userDataModel,
    );
    await saveUserDataLocal(userDataModel: userDataModel);
    return response;
  }

  Future<UserDataModel?> getUserData({required String userId}) async {
    final UserDataModel? response = await _userDataService.getUserData(
      userId: userId,
    );
    return response;
  }

  Future<void> updateUserFields({
    String? name,
    String? phone,
    String? picture,
    bool? isOldUser,
  }) async {
    await _userDataService.updateUserFields(
      name: name,
      phone: phone,
      picture: picture,
      isOldUser: isOldUser,
    );
  }
}

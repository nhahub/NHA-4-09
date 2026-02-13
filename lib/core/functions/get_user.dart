import 'dart:convert';

import '../constants/constants.dart';
import '../extensions/extensions.dart';
import '../models/user_data_model.dart';
import '../services/cache_helper.dart';

UserDataModel? getUser() {
  final jsonString = CacheHelper.getString(key: kUserData);
  if (jsonString.isNullOrEmpty()) {
    return null;
  }
  try {
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString!);
    return UserDataModel.fromJson(jsonMap);
  } catch (e) {
    return null;
  }
}

Future<void> saveUserDataLocal({required UserDataModel userDataModel}) async {
  final jsonString = jsonEncode(userDataModel.toJson());
  await CacheHelper.set(key: kUserData, value: jsonString);
}

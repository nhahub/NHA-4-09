// import 'dart:convert';
// import '../services/cache_helper.dart';

// UserEntity getUser(){
//   String jsonString = CacheHelper.getString(key: kUserData);
//   UserEntity userEntity = UserModel.fromJson(jsonDecode(jsonString));
//   return userEntity;
// }

// Future<void> saveUser(UserEntity user) async {
//   final jsonString = jsonEncode(UserModel.fromEntity(user).toJson());
//   await CacheHelper.set(key: kUserData, value: jsonString);
// }
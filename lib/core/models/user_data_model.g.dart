// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userId: json['userId'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      isNewUser: json['isNewUser'] as bool?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'isNewUser': instance.isNewUser,
    };

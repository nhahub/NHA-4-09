import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final String userId;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final bool? isNewUser;

  UserDataModel({
    required this.userId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.isNewUser,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

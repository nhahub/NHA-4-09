import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  @JsonKey(name: 'id')
  final String userId;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  @JsonKey(name: 'is_old_user')
  final bool? isOldUser;

  UserDataModel({
    required this.userId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.isOldUser,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

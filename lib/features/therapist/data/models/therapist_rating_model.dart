import 'package:json_annotation/json_annotation.dart';

part 'therapist_rating_model.g.dart';

@JsonSerializable()
class TherapistRatingModel {
  final String id;
  @JsonKey(name: 'therapist_id')
  final String therapistId;
  @JsonKey(name: 'user_id')
  final String userId;
  final num rating;
  final String review;
  @JsonKey(name: 'user_name')
  final String userName;
  @JsonKey(name: 'user_avatar')
  final String? userAvatar;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  TherapistRatingModel({
    required this.id,
    required this.therapistId,
    required this.userId,
    required this.rating,
    required this.review,
    required this.userName,
    required this.userAvatar,
    required this.createdAt,
  });

  factory TherapistRatingModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistRatingModelToJson(this);
}

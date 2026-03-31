import 'package:json_annotation/json_annotation.dart';

part 'app_rating_model.g.dart';

@JsonSerializable()
class AppRatingModel {
  final String? id;

  @JsonKey(name: 'user_id')
  final String userId;

  final int rating;

  final String feedback;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const AppRatingModel({
    this.id,
    required this.userId,
    required this.rating,
    required this.feedback,
    this.createdAt,
    this.updatedAt,
  });

  /// from JSON
  factory AppRatingModel.fromJson(Map<String, dynamic> json) =>
      _$AppRatingModelFromJson(json);

  /// to JSON
  Map<String, dynamic> toJson() => _$AppRatingModelToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'mood_model.g.dart';

@JsonSerializable()
class MoodModel {
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'current_mood')
  final String currentMood;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  MoodModel({
    required this.userId,
    required this.currentMood,
    required this.createdAt,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) =>
      _$MoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoodModelToJson(this);
}

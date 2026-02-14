// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodModel _$MoodModelFromJson(Map<String, dynamic> json) => MoodModel(
  userId: json['user_id'] as String,
  currentMood: json['current_mood'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$MoodModelToJson(MoodModel instance) => <String, dynamic>{
  'user_id': instance.userId,
  'current_mood': instance.currentMood,
  'created_at': instance.createdAt.toIso8601String(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRatingModel _$AppRatingModelFromJson(Map<String, dynamic> json) =>
    AppRatingModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      rating: (json['rating'] as num).toInt(),
      feedback: json['feedback'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AppRatingModelToJson(AppRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'rating': instance.rating,
      'feedback': instance.feedback,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistReviewModel _$TherapistReviewModelFromJson(
  Map<String, dynamic> json,
) => TherapistReviewModel(
  id: json['id'] as String,
  therapistId: json['therapist_id'] as String,
  userId: json['user_id'] as String,
  rating: json['rating'] as num,
  review: json['review'] as String,
  userName: json['user_name'] as String,
  userAvatar: json['user_avatar'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$TherapistReviewModelToJson(
  TherapistReviewModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'therapist_id': instance.therapistId,
  'user_id': instance.userId,
  'rating': instance.rating,
  'review': instance.review,
  'user_name': instance.userName,
  'user_avatar': instance.userAvatar,
  'created_at': instance.createdAt.toIso8601String(),
};

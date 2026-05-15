// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  sessionType: json['session_type'] as String,
  price: (json['price'] as num?)?.toDouble(),
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  therapistId: json['therapist_id'] as String,
  therapistName: json['therapist_name'] as String,
  therapistSpeciality: json['therapist_speciality'] as String,
  therapistImage: json['therapist_image'] as String,
  slotId: json['slot_id'] as String,
  slotStartTime: json['slot_start_time'] == null
      ? null
      : DateTime.parse(json['slot_start_time'] as String),
  slotEndTime: json['slot_end_time'] == null
      ? null
      : DateTime.parse(json['slot_end_time'] as String),
);

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'session_type': instance.sessionType,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'therapist_id': instance.therapistId,
      'therapist_name': instance.therapistName,
      'therapist_speciality': instance.therapistSpeciality,
      'therapist_image': instance.therapistImage,
      'slot_id': instance.slotId,
      'slot_start_time': instance.slotStartTime?.toIso8601String(),
      'slot_end_time': instance.slotEndTime?.toIso8601String(),
    };

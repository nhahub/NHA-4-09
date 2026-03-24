// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  therapistId: json['therapist_id'] as String,
  slotId: json['slot_id'] as String,
  sessionType: json['session_type'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'therapist_id': instance.therapistId,
      'slot_id': instance.slotId,
      'session_type': instance.sessionType,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };

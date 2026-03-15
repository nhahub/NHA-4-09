// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    ChatRoomModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      therapistId: json['therapist_id'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ChatRoomModelToJson(ChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'therapist_id': instance.therapistId,
      'created_at': instance.createdAt,
    };

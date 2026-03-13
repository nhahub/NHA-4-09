import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String id;
  @JsonKey(name: 'room_id')
  final String roomId;
  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'sender_type')
  final String senderType; // user | therapist
  final String message;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  MessageModel({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.senderType,
    required this.message,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
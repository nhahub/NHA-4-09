import 'package:json_annotation/json_annotation.dart';

part 'chat_room_model.g.dart';

@JsonSerializable()
class ChatRoomModel {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'therapist_id')
  final String therapistId;
  @JsonKey(name: 'created_at')
  final String createdAt;

  ChatRoomModel({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.createdAt,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomModelToJson(this);
}

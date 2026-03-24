import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'therapist_id')
  final String therapistId;

  @JsonKey(name: 'slot_id')
  final String slotId;

  @JsonKey(name: 'session_type')
  final String? sessionType;

  final double? price;

  final String? status;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  BookingModel({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.slotId,
    this.sessionType,
    this.price,
    this.status,
    this.createdAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

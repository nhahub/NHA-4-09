import 'package:json_annotation/json_annotation.dart';

part 'time_slot_model.g.dart';

@JsonSerializable()
class TimeSlotModel {
  final String id;
  @JsonKey(name: 'therapist_id')
  final String therapistId;
  @JsonKey(name: 'start_time')
  final DateTime startTime;
  @JsonKey(name: 'end_time')
  final DateTime endTime;
  @JsonKey(name: 'is_booked')
  final bool isBooked;

  const TimeSlotModel({
    required this.id,
    required this.therapistId,
    required this.startTime,
    required this.endTime,
    this.isBooked = false,
  });

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotModelToJson(this);

  int get dayOfWeek => startTime.weekday % 7;
}

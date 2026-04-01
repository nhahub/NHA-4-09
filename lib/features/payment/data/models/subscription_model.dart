import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  @JsonKey(name: 'user_id')
  final String userId;
  final String type;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  final String status;

  SubscriptionModel({
    required this.userId,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);

  bool get isActive =>
      status == 'active' &&
      startDate.isBefore(DateTime.now()) &&
      endDate.isAfter(DateTime.now());
}

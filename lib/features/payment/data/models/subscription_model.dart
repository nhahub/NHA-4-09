import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String type;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  final String status;
  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  SubscriptionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.transactionId,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);

  bool get isActive =>
      status == 'active' &&
      startDate.isBefore(DateTime.now()) &&
      endDate.isAfter(DateTime.now());
}

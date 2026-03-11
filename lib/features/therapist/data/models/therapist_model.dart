import 'package:json_annotation/json_annotation.dart';

import 'therapist_rating_summary.dart';

part 'therapist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TherapistModel {
  final String id;
  final String image;
  final String name;
  final String speciality;
  final String about;
  final num discount;
  @JsonKey(name: 'live_price')
  final num livePrice;
  @JsonKey(name: 'chat_price')
  final num chatPrice;
  @JsonKey(name: 'years_of_experience')
  final num yearsOfExperience;
  final String language;
  final String location;
  final TherapistRatingSummary ratingSummary;

  const TherapistModel({
    required this.id,
    required this.image,
    required this.name,
    required this.speciality,
    required this.discount,
    required this.livePrice,
    required this.chatPrice,
    required this.about,
    required this.yearsOfExperience,
    required this.language,
    required this.location,
    required this.ratingSummary,
  });

  /// live price after discount (1 decimal)
  num get livePriceAfterDiscount =>
      num.parse((livePrice * (1 - discount / 100)).toStringAsFixed(1));

  /// chat price after discount (1 decimal)
  num get chatPriceAfterDiscount =>
      num.parse((chatPrice * (1 - discount / 100)).toStringAsFixed(1));

  factory TherapistModel.fromJson(Map<String, dynamic> json) =>
      _$TherapistModelFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistModelToJson(this);
}

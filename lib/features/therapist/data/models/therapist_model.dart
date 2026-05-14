import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'therapist_rating_summary.dart';

part 'therapist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TherapistModel extends Equatable {
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

  TherapistModel copyWith({
    String? id,
    String? image,
    String? name,
    String? speciality,
    String? about,
    num? discount,
    num? livePrice,
    num? chatPrice,
    num? yearsOfExperience,
    String? language,
    String? location,
    TherapistRatingSummary? ratingSummary,
  }) => TherapistModel(
    id: id ?? this.id,
    image: image ?? this.image,
    name: name ?? this.name,
    speciality: speciality ?? this.speciality,
    about: about ?? this.about,
    discount: discount ?? this.discount,
    livePrice: livePrice ?? this.livePrice,
    chatPrice: chatPrice ?? this.chatPrice,
    yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
    language: language ?? this.language,
    location: location ?? this.location,
    ratingSummary: ratingSummary ?? this.ratingSummary,
  );
  @override
  List<Object?> get props => [
    id,
    image,
    name,
    speciality,
    about,
    discount,
    livePrice,
    chatPrice,
    yearsOfExperience,
    language,
    location,
    ratingSummary,
  ];

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

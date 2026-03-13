import 'package:json_annotation/json_annotation.dart';

part 'therapist_rating_summary.g.dart';

@JsonSerializable()
class TherapistRatingSummary {
  final double rating;
  final int totalCount;

  TherapistRatingSummary({
    required this.rating,
    required this.totalCount,
  });


  factory TherapistRatingSummary.fromJson(Map<String, dynamic> json) =>
      _$TherapistRatingSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistRatingSummaryToJson(this);
}
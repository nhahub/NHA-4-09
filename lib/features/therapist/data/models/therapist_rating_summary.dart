import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'therapist_rating_summary.g.dart';

@JsonSerializable()
class TherapistRatingSummary extends Equatable {
  final double rating;
  final int totalCount;

  const TherapistRatingSummary({
    required this.rating,
    required this.totalCount,
  });

  TherapistRatingSummary copyWith({double? rating, int? totalCount}) {
    return TherapistRatingSummary(
      rating: rating ?? this.rating,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  List<Object?> get props => [rating, totalCount];

  factory TherapistRatingSummary.fromJson(Map<String, dynamic> json) =>
      _$TherapistRatingSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistRatingSummaryToJson(this);
}

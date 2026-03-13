// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_rating_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistRatingSummary _$TherapistRatingSummaryFromJson(
  Map<String, dynamic> json,
) => TherapistRatingSummary(
  rating: (json['rating'] as num).toDouble(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$TherapistRatingSummaryToJson(
  TherapistRatingSummary instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'totalCount': instance.totalCount,
};

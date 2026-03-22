// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationModel _$RecommendationModelFromJson(Map<String, dynamic> json) =>
    RecommendationModel(
      title: json['title'] as String,
      description: json['description'] as String,
      avoid: json['avoid'] as String,
      suggestions: json['suggestions'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => RecommendationSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendationModelToJson(
  RecommendationModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'avoid': instance.avoid,
  'suggestions': instance.suggestions,
  'sections': instance.sections.map((e) => e.toJson()).toList(),
};

RecommendationSection _$RecommendationSectionFromJson(
  Map<String, dynamic> json,
) => RecommendationSection(
  category: json['category'] as String,
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$RecommendationSectionToJson(
  RecommendationSection instance,
) => <String, dynamic>{'category': instance.category, 'items': instance.items};

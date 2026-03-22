import 'package:json_annotation/json_annotation.dart';

part 'recommendation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecommendationModel {
  final String title;
  final String description;
  final String avoid;
  final String suggestions;
  final List<RecommendationSection> sections;

  RecommendationModel({
    required this.title,
    required this.description,
    required this.avoid,
    required this.suggestions,
    required this.sections,
  });

  // JSON serialization
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationModelToJson(this);
}

@JsonSerializable()
class RecommendationSection {
  final String category;
  final List<String> items;

  RecommendationSection({
    required this.category,
    required this.items,
  });

  factory RecommendationSection.fromJson(Map<String, dynamic> json) =>
      _$RecommendationSectionFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationSectionToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

import 'macros_model.dart';

part 'recommended_food_item_model.g.dart';

@JsonSerializable()
class RecommendedFoodItemModel {
  final String id;
  final String name;
  final List<String> nutrients;
  @JsonKey(name: 'meal_time')
  final List<String> mealTime;
  final String effects;
  final MacrosModel macros;
  final List<String> tags;
  final String image;

  RecommendedFoodItemModel({
    required this.id,
    required this.name,
    required this.nutrients,
    required this.effects,
    required this.tags,
    required this.image,
    required this.macros,
    required this.mealTime,
  });

  factory RecommendedFoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFoodItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedFoodItemModelToJson(this);
}

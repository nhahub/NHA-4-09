import 'package:json_annotation/json_annotation.dart';

import 'mood_food_model.dart';

part 'meals_category_model.g.dart';

@JsonSerializable()
class MealsCategoryModel {
  final List<MoodFoodModel> meals;
  final List<MoodFoodModel> snacks;
  final List<MoodFoodModel> drinks;
  final List<MoodFoodModel> avoid;

  MealsCategoryModel({
    required this.meals,
    required this.snacks,
    required this.drinks,
    required this.avoid,
  });

  factory MealsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoryModelToJson(this);
}

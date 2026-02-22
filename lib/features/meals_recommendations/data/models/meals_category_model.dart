import 'package:json_annotation/json_annotation.dart';

import '../../domain/enums/food_type.dart';
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

extension MealsCategoryModelExtension on MealsCategoryModel {
  List<MoodFoodModel> getListByCategory({required FoodType category}) {
    switch (category) {
      case FoodType.meals:
        return meals;
      case FoodType.snacks:
        return snacks;
      case FoodType.drinks:
        return drinks;
      case FoodType.avoid:
        return avoid;
    }
  }
}

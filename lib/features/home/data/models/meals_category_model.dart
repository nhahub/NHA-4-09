import 'package:json_annotation/json_annotation.dart';
import 'meal_model.dart';

part 'meals_category_model.g.dart';

@JsonSerializable()
class MealsCategoryModel {
  final List<MealModel> meals;
  final List<MealModel> snacks;
  final List<MealModel> drinks;
  final List<MealModel> avoid;

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
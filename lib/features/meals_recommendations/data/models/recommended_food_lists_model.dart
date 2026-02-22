import 'package:json_annotation/json_annotation.dart';

import '../../domain/enums/food_type.dart';
import 'recommended_food_item_model.dart';

part 'recommended_food_lists_model.g.dart';

@JsonSerializable()
class RecommendedFoodListsModel {
  final List<RecommendedFoodItemModel> meals;
  final List<RecommendedFoodItemModel> snacks;
  final List<RecommendedFoodItemModel> drinks;
  final List<RecommendedFoodItemModel> avoid;

  RecommendedFoodListsModel({
    required this.meals,
    required this.snacks,
    required this.drinks,
    required this.avoid,
  });

  factory RecommendedFoodListsModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFoodListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedFoodListsModelToJson(this);
}

extension RecommendedFoodListsModelExtension on RecommendedFoodListsModel {
  List<RecommendedFoodItemModel> getListByFoodType({
    required FoodType foodType,
  }) {
    switch (foodType) {
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

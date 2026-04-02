import '../../../../../core/theming/app_assets.dart';
import '../macros_model.dart';
import '../recommended_food_item_model.dart';

class DummyRecommendedFoodItems {
  static List<RecommendedFoodItemModel> dummyFoodItems = List.generate(
    6,
    (index) => RecommendedFoodItemModel(
      id: "food_$index",
      name: "Healthy Meal $index",
      nutrients: ["Protein", "Fiber", "Vitamins"],
      mealTime: ["Breakfast", "Lunch"],
      effects:
          "Helps improve energy levels, supports digestion, and boosts immunity.",
      tags: ["healthy", "low_calorie", "balanced"],
      image: AppAssets.dummyImageAsset,
      macros: MacrosModel(kcal: 0, carbohydrates: 0, proteins: 0, fats: 0),
    ),
  );
}

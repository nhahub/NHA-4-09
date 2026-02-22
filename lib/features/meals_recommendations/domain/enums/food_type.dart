enum FoodType { meals, snacks, drinks, avoid }

extension CategoryExtension on FoodType {
  String get title {
    switch (this) {
      case FoodType.meals:
        return "Meals";
      case FoodType.snacks:
        return "Snacks";
      case FoodType.drinks:
        return "Drinks";
      case FoodType.avoid:
        return "Avoid";
    }
  }
}

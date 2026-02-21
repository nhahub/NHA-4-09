import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meals_recommendations/data/models/mood_food_model.dart';
import '../widgets/meal_card.dart';

class MealsRecommendationsView extends StatelessWidget {
  const MealsRecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: MealCard(
                mealModel: MoodFoodModel(
                  id: "0",
                  name: "Warm Turmeric Milk",
                  type: "type",
                  nutrients: ["nutrients"],
                  effects: ["effects"],
                  tags: ["tags"],
                  image: "assets/images/meals/angry/warm_turmeric_milk.webp",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

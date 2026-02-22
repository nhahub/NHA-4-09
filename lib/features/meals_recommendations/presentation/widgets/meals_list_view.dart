import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meals_recommendations/data/models/mood_food_model.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/meal_card.dart';

class MealsListView extends StatelessWidget {
  final List<MoodFoodModel> food;
  const MealsListView({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: food.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == food.length - 1
                  ? const EdgeInsets.only(bottom: kAppHorizontalPadding)
                  : EdgeInsets.zero,
              child: MealCard(mealModel: food[index]),
            );
          },
        ),
      ),
    );
  }
}

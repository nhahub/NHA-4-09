import 'package:flutter/material.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/meal_card_data_container.dart';

import '../../data/models/mood_food_model.dart';

class MealCard extends StatelessWidget {
  final MoodFoodModel mealModel;

  const MealCard({super.key, required this.mealModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            mealModel.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MealCardDataContainer(title: mealModel.name),
          ),
        ],
      ),
    );
  }
}

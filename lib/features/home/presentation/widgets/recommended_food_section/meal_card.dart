import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/recommended_food_section/meal_card_data_container.dart';

import '../../../data/models/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel mealModel;

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

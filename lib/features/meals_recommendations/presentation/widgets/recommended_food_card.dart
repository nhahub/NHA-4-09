import 'package:flutter/material.dart';
import 'recommended_food_card_data_container.dart';

import '../../data/models/recommended_food_item_model.dart';

class RecommendedFoodCard extends StatelessWidget {
  final RecommendedFoodItemModel mealModel;

  const RecommendedFoodCard({super.key, required this.mealModel});

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
            child: RecommendedFoodCardDataContainer(title: mealModel.name),
          ),
        ],
      ),
    );
  }
}

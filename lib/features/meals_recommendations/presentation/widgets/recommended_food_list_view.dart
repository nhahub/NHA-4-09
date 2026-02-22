import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../data/models/recommended_food_item_model.dart';
import 'recommended_food_card.dart';

class RecommendedFoodListView extends StatelessWidget {
  final List<RecommendedFoodItemModel> food;
  final ScrollController controller;

  const RecommendedFoodListView({
    super.key,
    required this.food,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: ListView.separated(
          controller: controller,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: food.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == food.length - 1
                  ? const EdgeInsets.only(bottom: 12)
                  : EdgeInsets.zero,
              child: RecommendedFoodCard(mealModel: food[index]),
            );
          },
        ),
      ),
    );
  }
}

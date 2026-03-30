import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/recommended_food_item_model.dart';
import 'recommended_food_card.dart';

class RecommendedFoodListView extends StatelessWidget {
  final List<RecommendedFoodItemModel> food;
  final bool isLoading;
  final ScrollController controller;

  const RecommendedFoodListView({
    super.key,
    required this.food,
    required this.controller,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Skeletonizer(
          containersColor: Colors.grey[50],
          enabled: isLoading,
          child: ListView.separated(
            controller: controller,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: food.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    Routes.recommendedFoodDetailsView,
                    args: food[index],
                  );
                },
                child: Padding(
                  padding: index == food.length - 1
                      ? const EdgeInsets.only(bottom: 16)
                      : EdgeInsets.zero,
                  child: RecommendedFoodCard(
                    recommendedFoodItemModel: food[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

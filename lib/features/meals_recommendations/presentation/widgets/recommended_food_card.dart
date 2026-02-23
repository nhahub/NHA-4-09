import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/shared/category_container.dart';
import '../../../../core/constants/constants.dart';
import 'recommended_food_card_data_container.dart';

import '../../data/models/recommended_food_item_model.dart';

class RecommendedFoodCard extends StatelessWidget {
  final RecommendedFoodItemModel recommendedFoodItemModel;

  const RecommendedFoodCard({
    super.key,
    required this.recommendedFoodItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            recommendedFoodItemModel.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kAppSectionSpacing,
              top: kAppSectionSpacing,
            ),
            child: TagContainer(
              categoryTitle: recommendedFoodItemModel.tags.first,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RecommendedFoodCardDataContainer(
              title: recommendedFoodItemModel.name,
            ),
          ),
        ],
      ),
    );
  }
}

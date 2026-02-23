import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/meals_recommendations/data/models/recommended_food_item_model.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/macros_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/effects_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/meal_time_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/nutrients_section.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/recommended_food_card.dart';

class RecommendedFoodDetailsView extends StatelessWidget {
  final RecommendedFoodItemModel recommendedFoodItemModel;

  const RecommendedFoodDetailsView({
    super.key,
    required this.recommendedFoodItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BackButtonAppbar(title: "Food Details"),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 85),
                RecommendedFoodCard(
                  recommendedFoodItemModel: recommendedFoodItemModel,
                ),
                EffectsSection(effects: recommendedFoodItemModel.effects),
                MacrosSection(macros: recommendedFoodItemModel.macros),
                MealTimeSection(mealTime: recommendedFoodItemModel.mealTime),
                NutrientsSection(nutrients: recommendedFoodItemModel.nutrients),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

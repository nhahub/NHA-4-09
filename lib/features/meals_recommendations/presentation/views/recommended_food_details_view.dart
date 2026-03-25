import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/recommended_food_item_model.dart';
import '../widgets/effects_section.dart';
import '../widgets/macros_section.dart';
import '../widgets/meal_time_section.dart';
import '../widgets/nutrients_section.dart';
import '../widgets/recommended_food_card.dart';

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
          padding: const EdgeInsets.only(
            left: kAppHorizontalPadding,
            right: kAppHorizontalPadding,
            bottom: 8,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 110),
                RecommendedFoodCard(
                  withpush: false,
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

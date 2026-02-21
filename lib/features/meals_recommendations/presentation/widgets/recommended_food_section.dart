import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/widgets/app_section_header.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/recommended_food_card.dart';
import '../../../../core/constants/constants.dart';

class RecommendedFoodSection extends StatelessWidget {
  const RecommendedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Recommended Food"),
        const SizedBox(height: kAppSectionSpacing),
        GestureDetector(
          onTap: () {
            context.push(Routes.mealsRecommendationsView);
          },
          child: const RecommendedFoodCard(),
        ),
      ],
    );
  }
}

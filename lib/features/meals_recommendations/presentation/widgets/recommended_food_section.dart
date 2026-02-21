import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_section_header.dart';
import 'recommended_food_card.dart';
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

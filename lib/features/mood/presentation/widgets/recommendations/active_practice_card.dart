import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'expandable_item.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/recommendation_model.dart';

class ActivePracticeCard extends StatelessWidget {
  const ActivePracticeCard({super.key, required this.recommendationSection});

  final List<RecommendationSection> recommendationSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGreen.withAlpha(alphaFromPercentage(10)),
          width: 2,
        ),
        color: AppColors.lightGreen.withAlpha(alphaFromPercentage(10)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.brandGreen,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Text(
              "Active Practices".toUpperCase(),
              style: AppStyles.extraBold14.copyWith(
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ...recommendationSection.map(
            (section) => ExpandableItem(recommendationSection: section),
          ),
        ],
      ),
    );
  }
}

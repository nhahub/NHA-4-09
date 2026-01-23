import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import 'see_recommendations_button.dart';

class MoodRecommendationsContainer extends StatelessWidget {
  const MoodRecommendationsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0.33),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 0.67,
            spreadRadius: -1,
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "It seems like you had a harder time.",
            style: AppStyles.extraBold15,
          ),
          const SizedBox(height: 4),
          Text(
            "In recent days, your emotional state has been lower than your usual average.",
            style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
          ),
          const SizedBox(height: 16),
          const SeeRecommendationsButton(),
        ],
      ),
    );
  }
}

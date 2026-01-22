import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/see_recommendations_button.dart';

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
          Text(
            "It seems like you had a harder time.",
            style: AppStyles.extraBold15,
          ),
          SizedBox(height: 4),
          Text(
            "In recent days, your emotional state has been lower than your usual average.",
            style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
          ),
          SizedBox(height: 16),
          SeeRecommendationsButton(),
        ],
      ),
    );
  }
}



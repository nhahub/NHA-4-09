import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/see_recommendations_button.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../mood/data/models/recommendation_model.dart';

class RecommendationBody extends StatelessWidget {
  final RecommendationModel recommendationModel;
  final bool isLoading;
  const RecommendationBody({
    super.key,
    required this.recommendationModel,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recommendationModel.title, style: AppStyles.extraBold15),
          const SizedBox(height: 4),
          Text(
            recommendationModel.description,
            style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
          ),
          const SizedBox(height: 16),
          SeeRecommendationsButton(recommendationModel: recommendationModel),
        ],
      ),
    );
  }
}

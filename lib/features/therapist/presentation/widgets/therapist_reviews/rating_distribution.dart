import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';

class RatingDistribution extends StatelessWidget {
  final List<TherapistReviewModel> ratings;

  const RatingDistribution({super.key, required this.ratings});

  int count(int star) {
    return ratings.where((e) => e.rating == star).length;
  }

  double percent(int star) {
    if (ratings.isEmpty) return 0;
    return count(star) / ratings.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(6, (index) {
        final star = 5 - index;

        return Row(
          children: [
            Text("$star"),
            const SizedBox(width: 4),
            SvgPicture.asset(AppAssets.starIcon, width: 12),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: percent(star),
                minHeight: 4,
                backgroundColor: AppColors.lightGrey.withAlpha(
                  alphaFromPercentage(20),
                ),
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${(percent(star) * 100).toStringAsFixed(0)}%",
              style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
            ),
          ],
        );
      }),
    );
  }
}

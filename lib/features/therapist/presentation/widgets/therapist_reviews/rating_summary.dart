import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';
import '../therapist_details/custom_rating.dart';
import 'rating_distribution.dart';

class RatingSummary extends StatelessWidget {
  final List<TherapistReviewModel> ratings;
  final double average;
  final int count;

  const RatingSummary({
    super.key,
    required this.ratings,
    required this.average,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 8,
              children: [
                Text(average.toStringAsFixed(1), style: AppStyles.extraBold40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Out Of 5",
                    style: AppStyles.extraBold14.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomRating(
                  isEditable: false,
                  itemSize: 20,
                  userRating: average,
                ),
                const SizedBox(height: 6),
                Text("$count reviews"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        RatingDistribution(ratings: ratings),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import 'custom_rating.dart';

class TherapistRatingSection extends StatelessWidget {
  final double rating;
  final int ratingCount;
  final String therapistId;

  const TherapistRatingSection({
    super.key,
    required this.rating,
    required this.ratingCount,
    required this.therapistId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomRating(isEditable: false, userRating: rating),
            const SizedBox(width: 4),
            Text(
              "($ratingCount reviews)",
              style: AppStyles.extraBold16.copyWith(color: AppColors.lightGrey),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.push(Routes.therapistRatingsView, args: therapistId);
          },
          child: Text(
            "See all reviews",
            style: AppStyles.extraBold16.copyWith(color: AppColors.lightGrey),
          ),
        ),
      ],
    );
  }
}

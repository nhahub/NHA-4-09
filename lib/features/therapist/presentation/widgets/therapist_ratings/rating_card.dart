import 'package:flutter/material.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/user_avatar.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_rating_model.dart';
import 'rating_stars.dart';
import 'package:intl/intl.dart';

class RatingCard extends StatelessWidget {
  final TherapistRatingModel rating;

  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(
          isAnonymous: rating.userName == 'Anonymous',
          name: getUser()?.name ?? "",
          fontSize: 20,
          radius: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rating.userName, style: AppStyles.extraBold16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingStars(rating: rating.rating.toInt()),
                  Text(
                    DateFormat('MMM d, yyyy').format(rating.createdAt),
                    style: AppStyles.medium14.copyWith(
                      color: AppColors.bodyGray,
                    ),
                  ),
                ],
              ),
              Text(rating.review, style: AppStyles.regular14),
            ],
          ),
        ),
      ],
    );
  }
}

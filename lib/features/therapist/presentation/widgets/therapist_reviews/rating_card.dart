import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/widgets/user_avatar.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/custom_rating.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/review_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/therapist_review_actions.dart';
import '../../../../../core/functions/get_user.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';
import 'package:intl/intl.dart';

class RatingCard extends StatelessWidget {
  final TherapistReviewModel therapistRatingModel;

  const RatingCard({super.key, required this.therapistRatingModel});

  @override
  Widget build(BuildContext context) {
    final isOwner = therapistRatingModel.userId == getUser()!.userId;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(
          isAnonymous: therapistRatingModel.userName == 'Anonymous',
          name: therapistRatingModel.userName,
          fontSize: 20,
          radius: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    therapistRatingModel.userName,
                    style: AppStyles.extraBold16,
                  ),
                  if (isOwner)
                    TherapistReviewActions(
                      oldTherapistReviewModel: therapistRatingModel,
                      therapistId: therapistRatingModel.therapistId,
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRating(
                    isEditable: false,
                    itemSize: 15,
                    userRating: therapistRatingModel.rating.toDouble(),
                  ),
                  Text(
                    DateFormat(
                      'MMM d, yyyy',
                    ).format(therapistRatingModel.createdAt),
                    style: AppStyles.medium14.copyWith(
                      color: AppColors.bodyGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ReviewWidget(review: therapistRatingModel.review),
            ],
          ),
        ),
      ],
    );
  }
}

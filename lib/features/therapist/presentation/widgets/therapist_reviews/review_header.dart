import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../../domain/functions/is_review_owner.dart';
import '../therapist_details/custom_rating.dart';
import 'therapist_review_actions.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key, required this.therapistRatingModel});

  final TherapistReviewModel therapistRatingModel;

  @override
  Widget build(BuildContext context) {
    final bool isOwner = isReviewOwner(therapistRatingModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(therapistRatingModel.userName, style: AppStyles.extraBold16),
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
              DateFormat('MMM d, yyyy').format(therapistRatingModel.createdAt),
              style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
            ),
          ],
        ),
      ],
    );
  }
}

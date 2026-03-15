import 'package:flutter/material.dart';

import '../../../../../core/widgets/user_avatar.dart';
import '../../../data/models/therapist_review_model.dart';
import 'review_header.dart';
import 'review_widget.dart';

class ReviewCard extends StatelessWidget {
  final TherapistReviewModel therapistRatingModel;

  const ReviewCard({super.key, required this.therapistRatingModel});

  @override
  Widget build(BuildContext context) {
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
              ReviewHeader(therapistRatingModel: therapistRatingModel),
              const SizedBox(height: 6),
              ReviewWidget(review: therapistRatingModel.review),
            ],
          ),
        ),
      ],
    );
  }
}

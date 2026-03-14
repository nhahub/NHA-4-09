import 'package:flutter/material.dart';
import '../../../data/models/therapist_review_model.dart';
import 'review_card.dart';
import 'rating_summary.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_colors.dart';

class TherapistReviewsViewBody extends StatelessWidget {
  const TherapistReviewsViewBody({
    super.key,
    required this.ratings,
    this.isLoading = false,
    required this.avg,
    required this.count,
  });

  final List<TherapistReviewModel> ratings;
  final double avg;
  final int count;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Skeletonizer(
        containersColor: Colors.grey[50],
        enabled: isLoading,
        child: Column(
          children: [
            RatingSummary(ratings: ratings, average: avg, count: count),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: ratings.length,
                separatorBuilder: (context, index) {
                  return const Divider(height: 40, color: AppColors.lightGrey);
                },
                itemBuilder: (context, index) {
                  return ReviewCard(therapistRatingModel: ratings[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

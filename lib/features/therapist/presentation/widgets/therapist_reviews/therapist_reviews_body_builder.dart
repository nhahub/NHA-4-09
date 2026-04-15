import 'package:flutter/material.dart';

import '../../../data/models/dummy/dummy_therapist_reviews.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import 'no_reviews_widget.dart';
import 'therapist_reviews_view_body.dart';

class TherapistReviewsBodyBuilder extends StatelessWidget {
  final TherapistReviewsState state;

  const TherapistReviewsBodyBuilder({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case TherapistReviewsStatus.loading:
        return TherapistReviewsViewBody(
          ratings: DummyTherapistReviews.dummyReviews,
          isLoading: true,
          avg: 0,
          count: 0,
        );

      case TherapistReviewsStatus.failure:
        return Center(child: Text(state.error!));

      case TherapistReviewsStatus.success:
        if (state.reviews.isEmpty) {
          return const NoReviewsWidget();
        }

        return TherapistReviewsViewBody(
          ratings: state.reviews,
          avg: state.average ?? 0,
          count: state.totalCount ?? 0,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

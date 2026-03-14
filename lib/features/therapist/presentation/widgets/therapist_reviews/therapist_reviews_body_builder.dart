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
    switch (state) {
      case GetTherapistReviewsLoadingState():
        return TherapistReviewsViewBody(
          ratings: DummyTherapistReviews.dummyReviews,
          isLoading: true,
          avg: 0,
          count: 0,
        );

      case GetTherapistReviewsFailureState():
        final failureState = state as GetTherapistReviewsFailureState;
        return Center(child: Text(failureState.errorMessage));

      case GetTherapistReviewsSuccessState():
        final successState = state as GetTherapistReviewsSuccessState;
        if (successState.therapistReviewModel.isEmpty) {
          return const NoReviewsWidget();
        }

        return TherapistReviewsViewBody(
          ratings: successState.therapistReviewModel,
          avg: successState.average ?? 0,
          count:
              successState.totalCount ??
              successState.therapistReviewModel.length,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

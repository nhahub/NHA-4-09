import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/add_therapist_rating_button.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/no_reviews_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/therapist_ratings_view_body.dart';
import '../../data/models/dummy/dummy_therapist_reviews.dart';
import '../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';

class TherapistReviewsView extends StatelessWidget {
  final String therapistId;
  const TherapistReviewsView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistReviewsCubit, TherapistReviewsState>(
      builder: (context, state) {
        bool hasUserRated = false;
        if (state is GetTherapistReviewsLoadedState) {
          final String userId = getUser()!.userId;
          hasUserRated = state.therapistReviewModel.any(
            (r) => r.userId == userId,
          );
        }

        return Scaffold(
          floatingActionButton: !hasUserRated
              ? AddTherapistRatingButton(therapistId: therapistId)
              : null,
          appBar: const BackButtonAppbar(title: "Ratings & Reviews"),
          body: switch (state) {
            AddTherapistRatingsLoadingState() => TherapistRatingsViewBody(
              ratings: DummyTherapistReviews.dummyReviews,
              isLoading: true,
              avg: 0,
              count: 0,
            ),
            AddTherapistRatingsFailureState() => Center(
              child: Text(state.error),
            ),
            GetTherapistReviewsLoadedState() =>
              state.therapistReviewModel.isEmpty
                  ? const NoReviewsWidget()
                  : TherapistRatingsViewBody(
                      ratings: state.therapistReviewModel,
                      avg: state.average ?? 0.0,
                      count:
                          state.totalCount ?? state.therapistReviewModel.length,
                    ),
            _ => const SizedBox.shrink(),
          },
        );
      },
    );
  }
}

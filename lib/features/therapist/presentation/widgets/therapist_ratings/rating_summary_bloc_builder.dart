import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/therapist_rating_cubit/therapist_rating_cubit.dart';
import 'rating_summary.dart';

class RatingSummaryBlocBuilder extends StatelessWidget {
  const RatingSummaryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistRatingCubit, TherapistRatingState>(
      builder: (context, state) {
        if (state is TherapistRatingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TherapistRatingFailure) {
          return Center(child: Text(state.error));
        }

        if (state is TherapistRatingLoaded) {
          final ratings = state.ratings;
          final avg = state.average ?? 0.0;
          final count = state.totalCount ?? ratings.length;

          return RatingSummary(ratings: ratings, average: avg, count: count);
        }

        return const SizedBox();
      },
    );
  }
}

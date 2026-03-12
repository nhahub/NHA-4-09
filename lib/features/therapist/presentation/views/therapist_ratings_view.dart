import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/data/models/therapist_rating_model.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_therapist_rating_button.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/therapist_ratings_view_body.dart';
import '../../data/models/dummy/dummy_therapist_ratings.dart';
import '../manager/therapist_rating_cubit/therapist_rating_cubit.dart';

class TherapistRatingsView extends StatelessWidget {
  final String therapistId;
  const TherapistRatingsView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddTherapistRatingButton(therapistId: therapistId),
      appBar: const BackButtonAppbar(title: "Ratings & Reviews"),
      body: BlocBuilder<TherapistRatingCubit, TherapistRatingState>(
        builder: (context, state) {
          switch (state) {
            case AddTherapistRatingsLoadingState():
              return TherapistRatingsViewBody(
                ratings: DummyTherapistRatings.dummyRatings,
                isLoading: true,
                avg: 0,
                count: 0,
              );
            case AddTherapistRatingsFailureState():
              return Center(child: Text(state.error));

            case GetTherapistRatingsLoadedState():
              final List<TherapistRatingModel> ratings = state.ratings;
              final double avg = state.average ?? 0.0;
              final int count = state.totalCount ?? ratings.length;
              return TherapistRatingsViewBody(
                ratings: ratings,
                avg: avg,
                count: count,
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

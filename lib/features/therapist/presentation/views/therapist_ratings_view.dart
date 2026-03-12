import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_therapist_rating_button.dart';
import '../manager/therapist_rating_cubit/therapist_rating_cubit.dart';
import '../widgets/therapist_ratings/rating_card.dart';
import '../widgets/therapist_ratings/rating_summary_bloc_builder.dart';

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
          if (state is AddTherapistRatingsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddTherapistRatingsFailureState) {
            return Center(child: Text(state.error));
          }

          if (state is GetTherapistRatingsLoadedState) {
            final ratings = state.ratings;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const RatingSummaryBlocBuilder(),

                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ratings.length,
                      itemBuilder: (context, index) {
                        return RatingCard(rating: ratings[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

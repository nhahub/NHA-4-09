import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../widgets/therapist_reviews/add_therapist_review_button.dart';
import '../widgets/therapist_reviews/therapist_reviews_body_builder.dart';

class TherapistReviewsView extends StatelessWidget {
  final String therapistId;

  const TherapistReviewsView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistReviewsCubit, TherapistReviewsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const BackButtonAppbar(title: "Reviews"),
          floatingActionButton: state.status.isSuccess && !state.hasUserRated
              ? AddTherapistReviewButton(therapistId: therapistId)
              : null,

          body: TherapistReviewsBodyBuilder(state: state),
        );
      },
    );
  }
}

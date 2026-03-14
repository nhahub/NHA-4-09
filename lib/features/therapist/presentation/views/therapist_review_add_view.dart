import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/add_therapist_review_view_body.dart';

class TherapistReviewAddView extends StatelessWidget {
  final String therapistId;

  const TherapistReviewAddView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Add Review"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: BlocListener<TherapistReviewsCubit, TherapistReviewsState>(
          listener: (context, state) {
            if (state is AddTherapistReviewAddedState) {
              confirmDialog(
                context: context,
                title: "Done!",
                message: "We are very grateful for your review",
                onConfirm: () {
                  context.pop();
                  context.pop();
                },
              );
            } else if (state is AddTherapistRatingsFailureState) {
              errorDialog(context: context, message: state.error);
            }
          },
          child: AddTherapistReviewViewBody(therapistId: therapistId),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/data/models/therapist_review_model.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/update_therapist_review_view_body.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';

class TherapistReviewUpdateView extends StatelessWidget {
  final TherapistReviewModel oldTherapistReviewModel;
  final String therapistId;

  const TherapistReviewUpdateView({
    super.key,
    required this.therapistId,
    required this.oldTherapistReviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Update Review"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: BlocListener<TherapistReviewsCubit, TherapistReviewsState>(
          listener: (context, state) {
            if (state is UpdateTherapistRatingState) {
              confirmDialog(
                context: context,
                title: "Done!",
                message: "Your review has been updated",
                onConfirm: () {
                  context.pop();
                  context.pop();
                },
              );
            } else if (state is AddTherapistRatingsFailureState) {
              errorDialog(context: context, message: state.error);
            }
          },
          child: UpdateTherapistReviewViewBody(
            therapistId: therapistId,
            oldTherapistReviewModel: oldTherapistReviewModel,
          ),
        ),
      ),
    );
  }
}

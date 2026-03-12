import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_rating_cubit/therapist_rating_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/custom_rating.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_review_form_widget.dart';

class AddTherapistRatingView extends StatelessWidget {
  final String therapistId;

  const AddTherapistRatingView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Add Rating"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: BlocListener<TherapistRatingCubit, TherapistRatingState>(
          listener: (context, state) {
            if (state is GetTherapistRatingsLoadedState) {
              confirmDialog(
                context: context,
                title: "Review Added",
                message: "Review Added",
                onConfirm: () {
                  context.pop();
                },
              );
            } else if (state is AddTherapistRatingsFailureState) {
              errorDialog(context: context, message: state.error);
            }
          },
          child: Column(
            children: [
              CustomRating(
                isEditable: true,
                itemSize: 35,
                onRatingUpdate: (rating) {
                  context.read<TherapistRatingCubit>().updateUserRating(
                    rating: rating,
                  );
                },
              ),
              const SizedBox(height: 20),
              AddReviewFormWidget(therapistId: therapistId),
            ],
          ),
        ),
      ),
    );
  }
}

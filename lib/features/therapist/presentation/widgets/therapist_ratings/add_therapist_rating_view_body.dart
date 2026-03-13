import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_rating_cubit/therapist_rating_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/custom_rating.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_review_form_widget.dart';

class AddTherapistRatingViewBody extends StatelessWidget {
  const AddTherapistRatingViewBody({super.key, required this.therapistId});

  final String therapistId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text("Leave a Review", style: AppStyles.extraBold20),
        const SizedBox(height: 20),
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
    );
  }
}

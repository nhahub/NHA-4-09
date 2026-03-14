import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../therapist_details/custom_rating.dart';
import 'add_review_form_widget.dart';

class AddTherapistReviewViewBody extends StatelessWidget {
  const AddTherapistReviewViewBody({super.key, required this.therapistId});

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
            context.read<TherapistReviewsCubit>().updateUserRating(
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

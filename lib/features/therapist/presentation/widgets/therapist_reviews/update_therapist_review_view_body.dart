import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../therapist_details/custom_rating.dart';
import 'update_review_form_widget.dart';

class UpdateTherapistReviewViewBody extends StatelessWidget {
  final TherapistReviewModel oldTherapistReviewModel;

  const UpdateTherapistReviewViewBody({
    super.key,
    required this.therapistId,
    required this.oldTherapistReviewModel,
  });

  final String therapistId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        const Text("Update a Review", style: AppStyles.extraBold20),
        const SizedBox(height: 20),
        CustomRating(
          isEditable: true,
          userRating: oldTherapistReviewModel.rating.toDouble(),
          itemSize: 35,
          onRatingUpdate: (rating) {
            context.read<TherapistReviewsCubit>().updateUserRating(
              rating: rating,
            );
          },
        ),
        const SizedBox(height: 20),
        UpdateReviewFormWidget(
          therapistId: therapistId,
          oldTherapistReviewModel: oldTherapistReviewModel,
        ),
      ],
    );
  }
}

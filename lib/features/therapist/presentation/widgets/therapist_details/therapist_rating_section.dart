import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/therapist/data/models/therapist_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/therapist_cubit/therapist_cubit.dart';
import 'custom_rating.dart';

class TherapistRatingSection extends StatelessWidget {
  final TherapistModel therapistModel;

  const TherapistRatingSection({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<TherapistCubit, TherapistState>(
          builder: (context, state) {
            final therapist = state.therapists!.firstWhere(
              (t) => t.id == therapistModel.id,
            );

            final ratingCount = therapist.ratingSummary.totalCount;
            final rating = therapist.ratingSummary.rating;

            return Row(
              children: [
                CustomRating(isEditable: false, userRating: rating),
                const SizedBox(width: 4),
                Text(
                  "($ratingCount ${ratingCount == 1 ? 'review' : 'reviews'})",
                  style: AppStyles.extraBold16.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            );
          },
        ),
        GestureDetector(
          onTap: () {
            final TherapistCubit therapistCubit = context
                .read<TherapistCubit>();
            context.push(
              Routes.therapistReviewsView,
              args: {
                'therapistId': therapistModel.id,
                'therapistCubit': therapistCubit,
              },
            );
          },
          child: Text(
            "See all reviews",
            style: AppStyles.extraBold16.copyWith(color: AppColors.lightGrey),
          ),
        ),
      ],
    );
  }
}

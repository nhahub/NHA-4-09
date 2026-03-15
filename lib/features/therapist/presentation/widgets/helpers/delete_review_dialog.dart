import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';

Future<void> deleteReviewDialog({
  required BuildContext context,
  required TherapistReviewsCubit cubit,
  required String ratingId,
  required String therapistId,
}) {
  return showDialog(
    context: context,
    builder: (dialogContext) {
      return CustomDialog(
        buttonText: "Delete",
        bodyContent: "Are you sure you want to delete this review?",
        title: "Delete Review?",
        buttonColor: AppColors.darkRed,
        onPressed: () async {
          dialogContext.pop();
          cubit.deleteReview(ratingId: ratingId, therapistId: therapistId);
        },
      );
    },
  );
}

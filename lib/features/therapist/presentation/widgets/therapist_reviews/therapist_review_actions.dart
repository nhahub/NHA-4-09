import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../manager/therapist_cubit/therapist_cubit.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../helpers/delete_review_dialog.dart';

class TherapistReviewActions extends StatelessWidget {
  final TherapistReviewModel oldTherapistReviewModel;
  final String therapistId;

  const TherapistReviewActions({
    super.key,
    required this.therapistId,
    required this.oldTherapistReviewModel,
  });

  @override
  Widget build(BuildContext context) {
    final therapistReviewsCubit = context.read<TherapistReviewsCubit>();
    final therapistCubit = context.read<TherapistCubit>();

    return InkWell(
      borderRadius: BorderRadius.circular(555),
      child: SvgPicture.asset(
        AppAssets.dotsThreeIcon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.bodyGray,
          BlendMode.srcIn,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                ListTile(
                  leading: SvgPicture.asset(
                    AppAssets.editIcon,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.lightGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: const Text('Edit Review', style: AppStyles.regular17),
                  onTap: () {
                    context.pop();
                    context.push(
                      Routes.therapistRatingUpdateView,
                      args: {
                        'therapistCubit': therapistCubit,
                        'therapistId': therapistId,
                        'cubit': therapistReviewsCubit,
                        'oldTherapistReviewModel': oldTherapistReviewModel,
                      },
                    );
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    AppAssets.trashIcon,
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.lighterRed,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text(
                    'Delete Review',
                    style: AppStyles.regular17.copyWith(
                      color: AppColors.lighterRed,
                    ),
                  ),
                  onTap: () {
                    context.pop();
                    deleteReviewDialog(
                      context: context,
                      therapistReviewsCubit: therapistReviewsCubit,
                      ratingId: oldTherapistReviewModel.id,
                      therapistId: therapistId,
                      therapistCubit: therapistCubit,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

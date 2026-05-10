import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_cubit/therapist_cubit.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../therapist/data/models/therapist_model.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({super.key, required this.therapistModel});

  final TherapistModel therapistModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.buttonBlack.withAlpha(alphaFromPercentage(50)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: BlocBuilder<TherapistCubit, TherapistState>(
        builder: (context, state) {
          final ratingCount = therapistModel.ratingSummary.totalCount;
          final rating = therapistModel.ratingSummary.rating;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.starIcon, width: 12),
              const SizedBox(width: 5),
              Text(
                rating.toStringAsFixed(1),
                style: AppStyles.extraBold14.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 3),
              Text(
                "($ratingCount)",
                style: AppStyles.medium14WithShadow.copyWith(
                  color: Colors.white.withAlpha(alphaFromPercentage(80)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

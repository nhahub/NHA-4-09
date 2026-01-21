import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/sessions_for_you_model.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({super.key, required this.sessionsForYouModel});

  final SessionsForYouModel sessionsForYouModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.buttonBlack.withAlpha(alphaFromPercentage(50)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.starIcon, width: 12),
          const SizedBox(width: 5),
          Text(
            "${sessionsForYouModel.rating.rating}",
            style: AppStyles.extraBold14.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 3),
          Text(
            "(${sessionsForYouModel.rating.ratingCount})",
            style: AppStyles.medium14WithShadow.copyWith(
              color: Colors.white.withAlpha(alphaFromPercentage(80)),
            ),
          ),
        ],
      ),
    );
  }
}

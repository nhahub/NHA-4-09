import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/alpha_from_percent.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class PremiumContainer extends StatelessWidget {
  const PremiumContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
        gradient: const LinearGradient(
          colors: [AppColors.brandGreen, AppColors.lightGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.25, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.brandGreen.withAlpha(alphaFromPercentage(10)),
            offset: const Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.white.withAlpha(alphaFromPercentage(60)),
            offset: const Offset(0, -4),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: AppColors.shadow.withAlpha(alphaFromPercentage(32)),
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "Premium",
            style: AppStyles.medium15.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: AppColors.shadow.withAlpha(alphaFromPercentage(24)),
                  offset: const Offset(0, 0),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(AppAssets.premiumIcon, width: 12, height: 12),
        ],
      ),
    );
  }
}

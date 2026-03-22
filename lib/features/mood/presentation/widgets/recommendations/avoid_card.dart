import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_styles.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';

class AvoidCard extends StatelessWidget {
  final String avoid;

  const AvoidCard({super.key, required this.avoid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lighterRed.withAlpha(alphaFromPercentage(10)),
          width: 2,
        ),
        color: AppColors.lighterRed.withAlpha(alphaFromPercentage(10)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Avoid Right Now",
                style: AppStyles.extraBold20.copyWith(
                  color: AppColors.darkerRed,
                ),
              ),
              SvgPicture.asset(AppAssets.avoidIcon, height: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            avoid,
            style: AppStyles.medium16.copyWith(
              color: AppColors.darkerRed.withAlpha(alphaFromPercentage(80)),
            ),
          ),
        ],
      ),
    );
  }
}

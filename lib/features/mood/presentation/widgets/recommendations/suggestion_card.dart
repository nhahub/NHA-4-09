import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SuggestionCard extends StatelessWidget {
  final String suggestion;
  const SuggestionCard({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lighterBlue.withAlpha(alphaFromPercentage(20)),
          width: 2,
        ),
        color: AppColors.lighterBlue.withAlpha(alphaFromPercentage(10)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Suggestion",
                style: AppStyles.extraBold20.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              SvgPicture.asset(AppAssets.suggestionIcon, height: 25),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            suggestion,
            style: AppStyles.medium16.copyWith(
              color: AppColors.darkBlue.withAlpha(alphaFromPercentage(80)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';

class NumberOfStepsTracker extends StatelessWidget {
  final int numberOfSteps = 2245;
  const NumberOfStepsTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$numberOfSteps", style: AppStyles.extraBold21),
        const SizedBox(width: 5),
        Text(
          "/ 10,000",
          style: AppStyles.extraBold15.copyWith(color: AppColors.bodyGray),
        ),
        const Spacer(),
        SizedBox(
          width: 108,
          child: LinearProgressIndicator(
            value: numberOfSteps / 10000,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: AppColors.borderButton.withAlpha(
              alphaFromPercentage(6),
            ),
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.brandGreen,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "${(numberOfSteps / 10000 * 100).toStringAsFixed(0)}%",
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}

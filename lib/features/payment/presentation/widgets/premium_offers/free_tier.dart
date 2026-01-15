import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class FreeTier extends StatelessWidget {
  const FreeTier({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "30 days free. 287.90 RON / year. Cancel anytime.",
        style: AppStyles.medium14WithShadow.copyWith(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
      ),
    );
  }
}

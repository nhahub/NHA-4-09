import 'package:flutter/material.dart';
import '../extensions/context_extensions.dart';

import '../helpers/alpha_from_percent.dart';
import '../routing/routes.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class FreeContainer extends StatelessWidget {
  const FreeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.premiumView);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(10)),
              offset: const Offset(0, 0),
              blurRadius: 1,
              spreadRadius: -3,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
              offset: const Offset(0, 2),
              blurRadius: 10,
              spreadRadius: -3,
            ),
          ],
        ),
        child: Text(
          "Free",
          style: AppStyles.medium15.copyWith(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
            shadows: [
              Shadow(
                color: AppColors.shadow.withAlpha(alphaFromPercentage(80)),
                offset: const Offset(0, 0),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

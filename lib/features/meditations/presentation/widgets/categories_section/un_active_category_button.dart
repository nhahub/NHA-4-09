import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class UnActiveCategoryButton extends StatelessWidget {
  const UnActiveCategoryButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
          borderRadius: BorderRadius.circular(333),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.extraBold14.copyWith(color: AppColors.bodyGray),
          ),
        ),
      ),
    );
  }
}

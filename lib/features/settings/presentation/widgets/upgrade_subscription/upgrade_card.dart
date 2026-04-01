import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';

class UpgradeCard extends StatelessWidget {
  final String discount;

  final double finalYearlyPrice;

  const UpgradeCard({
    super.key,
    required this.discount,
    required this.finalYearlyPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.brandGreen, AppColors.lightGreen],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upgrade to Yearly",
            style: AppStyles.extraBold17.copyWith(color: Colors.white),
          ),
          Text(
            "Save $discount with yearly plan",
            style: AppStyles.regular14.copyWith(color: Colors.white70),
          ),
          Text(
            "\$${finalYearlyPrice.toStringAsFixed(2)} / year",
            style: AppStyles.extraBold17.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

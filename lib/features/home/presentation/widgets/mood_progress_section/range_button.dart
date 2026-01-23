import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class RangeButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const RangeButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: isSelected
                  ? AppColors.borderButton.withAlpha(alphaFromPercentage(6))
                  : Colors.transparent,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      offset: const Offset(0, 0.33),
                      color: AppColors.shadow.withAlpha(
                        alphaFromPercentage(12),
                      ),
                      blurRadius: 0.33,
                      spreadRadius: -0.67,
                    ),
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: AppColors.shadow.withAlpha(
                        alphaFromPercentage(12),
                      ),
                      blurRadius: 2.67,
                      spreadRadius: -1,
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppStyles.extraBold15.copyWith(
              color: isSelected ? Colors.black : AppColors.bodyGray,
            ),
          ),
        ),
      ),
    );
  }
}

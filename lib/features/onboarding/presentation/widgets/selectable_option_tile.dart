import 'package:flutter/material.dart';

import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class SelectableOptionTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final String icon;

  const SelectableOptionTile({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected
                ? AppColors.brandGreen
                : AppColors.bodyGray.withAlpha(alphaFromPercentage(6)),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              isSelected ? AppAssets.trueCheckBox : AppAssets.emptyCheckBox,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 18),
            Expanded(child: Text(text, style: AppStyles.p)),
            const SizedBox(width: 10),
            Image.asset(icon, width: 60, height: 60),
          ],
        ),
      ),
    );
  }
}

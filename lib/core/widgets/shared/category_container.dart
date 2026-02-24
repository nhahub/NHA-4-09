import 'package:flutter/material.dart';

import '../../extensions/string_extensions.dart';
import '../../helpers/alpha_from_percent.dart';
import '../../theming/app_colors.dart';
import '../../theming/app_styles.dart';

class CategoryContainer extends StatelessWidget {
  final String categoryTitle;
  final Color? containerColor;
  final Color? textColor;
  const CategoryContainer({
    super.key,
    required this.categoryTitle,
    this.containerColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color:
            containerColor ??
            AppColors.buttonBlack.withAlpha(alphaFromPercentage(50)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        categoryTitle.formatTitle(),
        style: AppStyles.bold14.copyWith(color: textColor ?? Colors.white),
      ),
    );
  }
}

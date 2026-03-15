import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';

class ActionItem extends StatelessWidget {
  final String iconSvg;
  final int? count;
  final VoidCallback onTap;
  final Color? countColor;
  final bool withCount;

  const ActionItem({
    super.key,
    required this.iconSvg,
    required this.onTap,
    this.withCount = true,
    this.count,
    this.countColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconSvg, width: 20, height: 20),
          if (withCount) ...[
            const SizedBox(width: 6),
            Text(
              count.toString(),
              style: AppStyles.extraBold14.copyWith(
                color: countColor ?? AppColors.bodyGray,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

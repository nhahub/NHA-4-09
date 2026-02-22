import 'package:flutter/material.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/theming/app_colors.dart';

class SurfaceCard extends StatelessWidget {
  final Widget child;
  const SurfaceCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.bgFill,
        border: Border.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

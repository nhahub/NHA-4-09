import 'package:flutter/material.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';

class PremiumBackground extends StatelessWidget {
  final Widget child;

  const PremiumBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.brandGreen, AppColors.lightGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.25, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                AppAssets.premiumShadow,
                fit: BoxFit.cover,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

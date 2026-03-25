import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/alpha_from_percent.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  const CustomFloatingActionButton({super.key, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(555),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [AppColors.lightGreen, AppColors.brandGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.75],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(10)),
              offset: const Offset(0, 0.67),
              blurRadius: 0.33,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(32)),
              offset: const Offset(0, 1.34),
              blurRadius: 4.01,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(7)),
              offset: const Offset(0, 37.74),
              blurRadius: 22.71,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
              offset: const Offset(0, 16.7),
              blurRadius: 16.7,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(14)),
              offset: const Offset(0, 4.34),
              blurRadius: 9.35,
              spreadRadius: 0,
            ),
          ],
        ),

        child: SvgPicture.asset(
          icon ?? AppAssets.addIcon,
          width: 22,
          height: 22,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/alpha_from_percent.dart';
import '../theming/app_colors.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({super.key, this.onTap, required this.icon});
  final VoidCallback? onTap;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(10)),
              offset: const Offset(0, 1),
              blurRadius: 1,
              spreadRadius: -3,
            ),
            BoxShadow(
              color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: -3,
            ),
          ],
        ),
        child: SvgPicture.asset(icon, width: 22),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';

class ContactWidget extends StatelessWidget {
  final String icon;
  final int price;
  final double additionalWidth;
  final double iconSize;

  const ContactWidget({
    super.key,
    required this.icon,
    required this.price,
    required this.iconSize,
    this.additionalWidth = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: const ColorFilter.mode(
            AppColors.brandGreen,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: additionalWidth),
        Text(
          "$price USD",
          style: AppStyles.extraBold15.copyWith(color: AppColors.linkGray),
        ),
        const SizedBox(width: 3),
        Text(
          "/ hour",
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}

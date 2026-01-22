import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';

class CustomThreeDotsIcon extends StatelessWidget {
  const CustomThreeDotsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.dotsThreeIcon,
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(AppColors.linkGray, BlendMode.srcIn),
    );
  }
}

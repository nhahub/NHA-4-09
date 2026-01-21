import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_colors.dart';
import 'package:flutter/material.dart';

class NavWidget extends StatelessWidget {
  const NavWidget({
    super.key,
    required this.selectedIndex,
    required this.icons,
    required this.index,
  });

  final int selectedIndex;
  final int index;
  final List<String> icons;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return SvgPicture.asset(
      icons[index],
      width: 28,
      height: 28,
      colorFilter: ColorFilter.mode(
        isSelected
            ? Colors.white
            : AppColors.borderButton.withAlpha(alphaFromPercentage(50)),
        BlendMode.srcIn,
      ),
    );
  }
}

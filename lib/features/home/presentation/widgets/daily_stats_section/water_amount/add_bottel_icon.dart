import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/theming/app_assets.dart';
import '../../../../../../core/theming/app_colors.dart';

class AddBottelIcon extends StatelessWidget {
  const AddBottelIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.34),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(58)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: SvgPicture.asset(
        AppAssets.addIcon,
        width: 13,
        colorFilter: ColorFilter.mode(AppColors.linkGray, BlendMode.srcIn),
      ),
    );
  }
}

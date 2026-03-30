import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class CustomSettingsTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final double? iconSize;
  final Color? iconColor;
  final Color? iconBackGroundColor;
  const CustomSettingsTile({
    required this.onTap,
    required this.title,
    required this.icon,
    this.iconColor,
    this.iconSize = 20,
    this.iconBackGroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor:
            iconBackGroundColor ?? AppColors.lightGrey.withAlpha(40),
        child: SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.brandGreen,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Text(title, style: AppStyles.medium16),
      trailing: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(333),
        child: const Icon(Icons.chevron_right, color: AppColors.bodyGray),
      ),
    );
  }
}

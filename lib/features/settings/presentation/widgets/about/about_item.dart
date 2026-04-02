import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class AboutItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const AboutItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.linkGray.withAlpha(alphaFromPercentage(8)),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.buttonBlack, size: 20),
      ),
      title: Text(title, style: AppStyles.medium16),
      subtitle: Text(
        subtitle!,
        style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
      ),
    );
  }
}

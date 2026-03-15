import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class InfoCard extends StatelessWidget {
  final String infoIcon;
  final String infoValue;
  final String infoTitle;

  const InfoCard({
    super.key,
    required this.infoIcon,
    required this.infoValue,
    required this.infoTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xfff8f8f8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SvgPicture.asset(infoIcon, height: 24),
          const SizedBox(height: 16),
          Text(infoValue, style: AppStyles.extraBold16),
          const SizedBox(height: 4),
          Text(
            infoTitle,
            style: AppStyles.regular14.copyWith(color: AppColors.linkGray),
          ),
        ],
      ),
    );
  }
}

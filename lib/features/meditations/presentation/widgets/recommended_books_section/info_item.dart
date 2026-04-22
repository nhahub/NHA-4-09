import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class InfoItem extends StatelessWidget {
  final String data;
  final String label;

  const InfoItem({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data, style: AppStyles.medium14.copyWith(color: Colors.black)),
        Text(
          label,
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}

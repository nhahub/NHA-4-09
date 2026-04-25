import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class PublishItem extends StatelessWidget {
  final String data;
  final String label;
  const PublishItem({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppStyles.semiBold16.copyWith(color: Colors.black),
          ),
          TextSpan(
            text: " : $data",
            style: AppStyles.semiBold16.copyWith(color: AppColors.bodyGray),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomDivider(),
        const SizedBox(width: 5),
        Text('or', style: AppStyles.p.copyWith(color: AppColors.bodyGray)),
        const SizedBox(width: 5),
        const CustomDivider(),
      ],
    );
  }
}

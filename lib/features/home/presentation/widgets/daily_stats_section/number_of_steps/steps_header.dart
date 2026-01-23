import 'package:flutter/material.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../shared/custom_three_dots_icon.dart';

class StepsHeader extends StatelessWidget {
  const StepsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Steps",
          style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
        ),
        const Spacer(),
        GestureDetector(onTap: () {}, child: const CustomThreeDotsIcon()),
      ],
    );
  }
}

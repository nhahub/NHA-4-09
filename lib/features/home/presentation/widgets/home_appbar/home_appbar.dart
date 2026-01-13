import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Home", style: AppStyles.h1),
        const SizedBox(width: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
            ),
          ),
          child: const Text("Free"),
        ),
        const Spacer(),
        CustomCircleButton(icon: AppAssets.slidersHorizontalIcon, onTap: () {}),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';
import '../../../../../core/widgets/free_container.dart';
import '../../../../../core/widgets/premium_container.dart';

class MeditationsAppBar extends StatelessWidget {
  final bool isPremium;
  const MeditationsAppBar({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text("Meditations", style: AppStyles.extraBold27),
              SizedBox(width: 10),
              isPremium ? const PremiumContainer() : FreeContainer(),
            ],
          ),
          CustomCircleButton(icon: AppAssets.serachIcon, onTap: () {}),
        ],
      ),
    );
  }
}

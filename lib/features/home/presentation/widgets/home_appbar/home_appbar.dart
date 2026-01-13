import 'package:flutter/material.dart';
import '../../../../../core/widgets/free_container.dart';
import '../../../../../core/widgets/premium_container.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';

class HomeAppbar extends StatelessWidget {
  final bool isPremium;
  const HomeAppbar({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Home", style: AppStyles.h1),
        const SizedBox(width: 20),
        isPremium ? const PremiumContainer() : FreeContainer(),
        const Spacer(),
        CustomCircleButton(icon: AppAssets.slidersHorizontalIcon, onTap: () {}),
      ],
    );
  }
}

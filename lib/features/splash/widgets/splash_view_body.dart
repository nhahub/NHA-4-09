import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theming/app_assets.dart';
import '../../../core/theming/app_colors.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.lightGreen, AppColors.brandGreen],
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          AppAssets.zenspunLogo,
          width: 120,
          height: 120,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

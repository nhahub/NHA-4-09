import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class WelcomeView extends StatelessWidget {
  final VoidCallback onNext;
  const WelcomeView({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(AppAssets.welcomeBackground),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Text("Welcome to Moodly!", style: AppStyles.extraBold27),
              const SizedBox(height: 5),
              Text(
                "Let's set up your personal space. Find a quiet moment — a few quick questions will help personalize your experience.",
                style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppTextButton(
                onPressed: onNext,
                withGradient: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Continue", style: AppStyles.extraBold15),
                      const SizedBox(width: 8),
                      SvgPicture.asset(AppAssets.arrowRightIcon, width: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}

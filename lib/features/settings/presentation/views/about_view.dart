import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/settings/presentation/widgets/about/about_item.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "About"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            /// App Logo
            SvgPicture.asset(AppAssets.moodlyLogo, width: 80, height: 80),
            const SizedBox(height: 16),

            /// App Name
            const Text("Moodly", style: AppStyles.extraBold21),

            const SizedBox(height: 4),

            /// Version
            Text(
              "Version 1.0.0",
              style: AppStyles.medium14.copyWith(color: AppColors.linkGray),
            ),

            const SizedBox(height: 20),

            /// Description
            Text(
              "Moodly helps you track your mood, understand your emotions better.",
              textAlign: TextAlign.center,
              style: AppStyles.medium16.copyWith(color: AppColors.bodyGray),
            ),

            const SizedBox(height: 30),

            /// Divider
            Divider(color: Colors.grey.shade300),

            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  AboutItem(
                    icon: Icons.person_outline,
                    title: "Developed by",
                    subtitle: "Moodly Team",
                  ),
                  AboutItem(
                    icon: Icons.email_outlined,
                    title: "Contact Us",
                    subtitle: "support@moodly.app",
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Footer
            Text(
              "© 2026 Moodly. All rights reserved.",
              style: AppStyles.medium14.copyWith(color: AppColors.linkGray),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

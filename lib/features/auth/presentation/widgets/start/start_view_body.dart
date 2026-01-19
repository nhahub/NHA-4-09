import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import 'login_with_email_button.dart';
import 'login_with_facebook_button.dart';
import 'login_with_google_button.dart';
import 'or_divider.dart';
import 'terms_and_conditions.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.start),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Column(
                children: [
                  const Text(
                    'Your safe space for\nmind and soul.',
                    style: AppStyles.extraBold27,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Guided meditations, mood tracking, and\ncommunity support — all in one app.',
                    style: AppStyles.medium15.copyWith(
                      color: AppColors.bodyGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const LoginWithEmailButton(),
                  const SizedBox(height: 20),
                  const OrDivider(),
                  const SizedBox(height: 20),
                  const LoginWithFacebookButton(),
                  const SizedBox(height: 20),
                  const LoginWithGoogleButton(),
                  const SizedBox(height: 30),
                  const TermsAndConditions(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

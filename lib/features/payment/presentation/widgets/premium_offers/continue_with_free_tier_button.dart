import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ContinueWithFreeTierButton extends StatelessWidget {
  const ContinueWithFreeTierButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              context.pushReplacement(Routes.mainView);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: AppColors.borderButton.withAlpha(
                alphaFromPercentage(18),
              ),
            ),
            child: Text(
              "Continue on the Free Tier",
              textAlign: TextAlign.center,
              style: AppStyles.extraBold15WithShadow.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

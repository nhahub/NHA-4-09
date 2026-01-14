import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
        ),
        const SizedBox(width: 3),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            "Login.",
            style: AppStyles.medium15.copyWith(
              color: AppColors.linkGray,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.linkGray,
            ),
          ),
        ),
      ],
    );
  }
}

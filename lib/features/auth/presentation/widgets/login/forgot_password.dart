import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.push(Routes.forgotPasswordView);
      },
      child: Text(
        "Forgot password?",

        style: AppStyles.p.copyWith(
          color: AppColors.linkGray,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.linkGray,
        ),
      ),
    );
  }
}

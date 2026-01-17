import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New here?",
          style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
        ),
        const SizedBox(width: 3),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.registerView);
          },
          child: Text(
            "Create an account.",
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

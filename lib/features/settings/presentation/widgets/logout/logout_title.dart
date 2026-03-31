import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class LogoutTitle extends StatelessWidget {
  const LogoutTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Logout",
      style: AppStyles.extraBold21.copyWith(color: AppColors.lighterRed),
    );
  }
}

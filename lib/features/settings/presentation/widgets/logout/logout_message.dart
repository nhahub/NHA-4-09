import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class LogoutMessage extends StatelessWidget {
  const LogoutMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Are you sure you want to logout?",
      style: AppStyles.semiBold17.copyWith(color: AppColors.linkGray),
    );
  }
}

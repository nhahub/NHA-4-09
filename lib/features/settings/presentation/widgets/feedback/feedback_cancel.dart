import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theming/app_styles.dart';

class FeedbackCancel extends StatelessWidget {
  const FeedbackCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: Text(
        "Maybe later",
        style: AppStyles.regular14.copyWith(color: AppColors.linkGray),
      ),
    );
  }
}

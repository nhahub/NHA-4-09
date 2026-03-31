import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class LogoutButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Widget? child;

  const LogoutButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: isPrimary
              ? AppColors.lighterRed
              : AppColors.moreLighterRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child:
            child ??
            Text(
              text,
              style: AppStyles.semiBold17.copyWith(
                color: isPrimary ? Colors.white : AppColors.lighterRed,
              ),
            ),
      ),
    );
  }
}

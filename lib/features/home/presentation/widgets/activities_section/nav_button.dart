import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const NavButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDisabled ? AppColors.lightGrey : AppColors.lightGreen,
        ),
        child: Icon(icon, color: isDisabled ? Colors.grey : Colors.white),
      ),
    );
  }
}

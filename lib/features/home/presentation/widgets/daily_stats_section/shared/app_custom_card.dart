import 'package:flutter/material.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/theming/app_colors.dart';

class AppCustomCard extends StatelessWidget {
  final Widget child;
  const AppCustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: child,
    );
  }
}

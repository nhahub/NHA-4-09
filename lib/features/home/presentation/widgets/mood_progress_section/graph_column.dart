import 'package:flutter/material.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';

class GraphColumn extends StatelessWidget {
  const GraphColumn({
    super.key,
    required this.barWidth,
    required this.barHeight,
  });

  final double barWidth;
  final double barHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: barWidth,
      height: barHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.lightGreen, AppColors.brandGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.75],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(alphaFromPercentage(60)),
            offset: const Offset(0, 1.34),
            blurRadius: 1.34,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            offset: const Offset(0, 1.34),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/data/models/feeling_today_model.dart';

class FeelingTodayWidget extends StatelessWidget {
  final int index;
  const FeelingTodayWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(feelingTodayData[index].icon, width: 27),
          const SizedBox(height: 8),
          Image.asset(AppAssets.shadow, height: 8, width: 27),
          const SizedBox(height: 8),
          Text(
            feelingTodayData[index].feeling,
            textAlign: TextAlign.center,
            style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
          ),
        ],
      ),
    );
  }
}

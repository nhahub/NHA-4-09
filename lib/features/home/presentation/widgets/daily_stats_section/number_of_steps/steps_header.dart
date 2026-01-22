import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/custom_three_dots_icon.dart';

class StepsHeader extends StatelessWidget {
  const StepsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Steps",
          style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
        ),
        Spacer(),
        GestureDetector(onTap: () {}, child: const CustomThreeDotsIcon()),
      ],
    );
  }
}

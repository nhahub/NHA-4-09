import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/daily_stats_container.dart';
import '../../../../../../core/widgets/app_section_header.dart';

class DailyStatsSection extends StatelessWidget {
  const DailyStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Daily Stats"),
        const SizedBox(height: kAppSectionSpacing),
        DailyStatsContainer(),
      ],
    );
  }
}

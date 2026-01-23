import 'package:flutter/material.dart';
import '../../../../../../core/constants/constants.dart';
import 'daily_stats_container.dart';
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

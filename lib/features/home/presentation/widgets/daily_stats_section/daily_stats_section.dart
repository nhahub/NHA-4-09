import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class DailyStatsSection extends StatelessWidget {
  const DailyStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "Daily Stats"),
        Container(),
      ],
    );
  }
}

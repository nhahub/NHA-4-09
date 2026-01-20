import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'your_daily_routine_list_view.dart';

import '../../../../../core/widgets/app_section_header.dart';

class YourDailyRoutineSection extends StatelessWidget {
  const YourDailyRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Your daily routine"),
        const SizedBox(height: kAppSectionSpacing),
        const YourDailyRoutineListView(),
      ],
    );
  }
}

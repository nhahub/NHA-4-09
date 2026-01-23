import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'your_daily_routine_list_view.dart';

class YourDailyRoutineSection extends StatelessWidget {
  const YourDailyRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Your daily routine"),
        SizedBox(height: kAppSectionSpacing),
        YourDailyRoutineListView(),
      ],
    );
  }
}

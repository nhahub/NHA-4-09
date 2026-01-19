import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/presentation/widgets/your_daily_routine_section/your_daily_routine_list_view.dart';

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

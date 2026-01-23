import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'feeling_today_table.dart';

class FeelingTodaySection extends StatelessWidget {
  const FeelingTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "How are you feeling today?"),
        SizedBox(height: kAppSectionSpacing),
        FeelingTodayTable(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'feeling_today_table.dart';
import '../../../../../core/widgets/app_section_header.dart';

class FeelingTodaySection extends StatelessWidget {
  const FeelingTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "How are you feeling today?"),
        const SizedBox(height: kAppSectionSpacing),
        FeelingTodayTable(),
      ],
    );
  }
}

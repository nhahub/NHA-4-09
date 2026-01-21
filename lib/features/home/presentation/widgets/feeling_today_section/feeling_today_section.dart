import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/feeling_today_section/feeling_today_table.dart';
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

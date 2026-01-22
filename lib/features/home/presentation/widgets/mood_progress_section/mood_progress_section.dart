import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_progress_container.dart';
import '../../../../../core/widgets/app_section_header.dart';

class MoodProgressSection extends StatelessWidget {
  const MoodProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Mood Progress"),
        const SizedBox(height: kAppSectionSpacing),
        MoodProgressBody(),
      ],
    );
  }
}

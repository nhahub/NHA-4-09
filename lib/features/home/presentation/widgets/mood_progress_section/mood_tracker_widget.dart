import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_graph_switcher.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_range_selector.dart';

class MoodTrackerWidget extends StatelessWidget {
  const MoodTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MoodRangeSelector(),
        SizedBox(height: 16),
        MoodGraphSwitcher(),
      ],
    );
  }
}

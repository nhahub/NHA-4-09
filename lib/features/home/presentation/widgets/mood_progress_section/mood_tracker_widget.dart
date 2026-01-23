import 'package:flutter/material.dart';

import 'mood_graph_switcher.dart';
import 'mood_range_selector.dart';

class MoodTrackerWidget extends StatelessWidget {
  const MoodTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MoodRangeSelector(),
        SizedBox(height: 16),
        MoodGraphSwitcher(),
      ],
    );
  }
}

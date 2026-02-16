import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/app_custom_card.dart';
import 'number_of_steps_tracker.dart';
import 'steps_header.dart';

class NumberOfStepsCard extends StatelessWidget {
  const NumberOfStepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCustomCard(
      child: Column(
        children: [StepsHeader(), SizedBox(height: 10), NumberOfStepsTracker()],
      ),
    );
  }
}

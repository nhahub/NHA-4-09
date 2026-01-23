import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_tracker_widget.dart';
import '../../../../../core/constants/static.dart';
import 'mood_recommendations_container.dart';

class MoodProgressBody extends StatelessWidget {
  const MoodProgressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        children: [
          MoodTrackerWidget(),
          SizedBox(height: 16),
          MoodRecommendationsContainer(),
        ],
      ),
    );
  }
}

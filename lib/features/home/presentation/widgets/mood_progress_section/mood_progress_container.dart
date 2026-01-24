import 'package:flutter/material.dart';

import '../../../../../core/constants/static.dart';
import 'mood_recommendations_container.dart';
import 'mood_tracker_widget.dart';

class MoodProgressBody extends StatelessWidget {
  const MoodProgressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
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

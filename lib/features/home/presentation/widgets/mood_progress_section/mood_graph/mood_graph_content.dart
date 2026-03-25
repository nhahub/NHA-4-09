import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../mood/data/models/mood_chart.dart';
import '../../../../../mood/presentation/manager/mood_progress_cubit/mood_progress_cubit.dart';
import '../../../../../therapist/data/models/dummy/dummy_mood_data.dart';
import '../../../../domain/enums/mood_time_range.dart';
import 'custom_mood_progress_graph.dart';

class MoodGraphContent extends StatelessWidget {
  final MoodPeriod period;
  final MoodProgressState state;
  final List<MoodChart> moodData;

  const MoodGraphContent({
    super.key,
    required this.period,
    required this.state,
    required this.moodData,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && moodData.isEmpty) {
      return Skeletonizer(
        containersColor: Colors.grey[50],
        enabled: true,
        child: CustomMoodProgressGraph(
          moodData: _fakeData(),
          isLoading: true,
          barWidth: _barWidth(),
        ),
      );
    }

    if (state.failureMessage != null) {
      return SizedBox(
        height: 202,
        child: Center(child: Text('Error: ${state.failureMessage}')),
      );
    }

    return CustomMoodProgressGraph(moodData: moodData, barWidth: _barWidth());
  }

  double _barWidth() {
    switch (period) {
      case MoodPeriod.month:
        return 40;
      case MoodPeriod.year:
        return 20;
      case MoodPeriod.week:
        return 33.39;
    }
  }

  List<MoodChart> _fakeData() {
    switch (period) {
      case MoodPeriod.week:
        return DummyMoodData.weeklyMood;
      case MoodPeriod.month:
        return DummyMoodData.monthlyMood;
      case MoodPeriod.year:
        return DummyMoodData.yearlyMood;
    }
  }
}

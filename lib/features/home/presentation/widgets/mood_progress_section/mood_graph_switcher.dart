import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/enums/mood_time_range.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'monthly_mood_graph.dart';
import 'weekly_mood_graph.dart';
import 'yearly_mood_graph.dart';

class MoodGraphSwitcher extends StatelessWidget {
  const MoodGraphSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodRangeCubit, MoodTimeRange>(
      builder: (context, range) {
        switch (range) {
          case MoodTimeRange.weekly:
            return WeeklyMoodGraph();
          case MoodTimeRange.monthly:
            return MonthlyMoodGraph();
          case MoodTimeRange.yearly:
            return YearlyMoodGraph();
        }
      },
    );
  }
}

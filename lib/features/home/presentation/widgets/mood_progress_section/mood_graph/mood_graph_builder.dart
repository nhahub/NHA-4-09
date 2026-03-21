import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/enums/mood_time_range.dart';
import '../../../../../mood/data/models/mood_chart.dart';
import '../../../../../mood/presentation/manager/mood_progress_cubit/mood_progress_cubit.dart';
import 'mood_graph_content.dart';

class MoodGraphBuilder extends StatelessWidget {
  final MoodPeriod period;

  const MoodGraphBuilder({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodProgressCubit, MoodProgressState>(
      builder: (context, state) {
        List<MoodChart> moodData = [];

        switch (period) {
          case MoodPeriod.week:
            moodData = state.weekMood ?? [];
            break;
          case MoodPeriod.month:
            moodData = state.monthMood ?? [];
            break;
          case MoodPeriod.year:
            moodData = state.yearMood ?? [];
            break;
        }

        return MoodGraphContent(
          period: period,
          state: state,
          moodData: moodData,
        );
      },
    );
  }
}

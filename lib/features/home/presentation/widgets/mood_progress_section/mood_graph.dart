import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/enums/mood_time_range.dart';
import '../../../../mood/data/models/mood_chart.dart';
import '../../../../mood/presentation/manager/mood_progress_cubit/mood_progress_cubit.dart';
import '../../../../therapist/data/models/dummy/dummy_mood_data.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'custom_mood_progress_graph.dart';

class MoodGraph extends StatelessWidget {
  final MoodPeriod period;

  const MoodGraph({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MoodProgressCubit>();

    switch (period) {
      case MoodPeriod.week:
        if (cubit.state.weekMood == null && !cubit.state.isLoading) {
          cubit.getCurrentWeekMood();
        }
        break;
      case MoodPeriod.month:
        if (cubit.state.monthMood == null && !cubit.state.isLoading) {
          cubit.getCurrentMonthMood();
        }
        break;
      case MoodPeriod.year:
        if (cubit.state.yearMood == null && !cubit.state.isLoading) {
          cubit.getCurrentYearMood();
        }
        break;
    }

    return BlocBuilder<MoodProgressCubit, MoodProgressState>(
      builder: (context, state) {
        List<MoodChart> moodData = [];

        // Get data based on the selected period
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

        if (state.isLoading && moodData.isEmpty) {
          return Skeletonizer(
            containersColor: Colors.grey[50],
            enabled: true,
            child: CustomMoodProgressGraph(
              moodData: getFakeData(moodData),
              isLoading: true,
              barWidth: period == MoodPeriod.month
                  ? 40
                  : period == MoodPeriod.year
                  ? 20
                  : 33.39,
            ),
          );
        }

        if (state.failureMessage != null) {
          return SizedBox(
            height: 202,
            child: Center(child: Text('Error: ${state.failureMessage}')),
          );
        }

        // Render the chart
        return CustomMoodProgressGraph(
          moodData: moodData,
          barWidth: period == MoodPeriod.month
              ? 40
              : period == MoodPeriod.year
              ? 20
              : 33.39,
        );
      },
    );
  }

  List<MoodChart> getFakeData(List<MoodChart> moodData) {
    switch (period) {
      case MoodPeriod.week:
        moodData = DummyMoodData.weeklyMood;
        break;
      case MoodPeriod.month:
        moodData = DummyMoodData.monthlyMood;
        break;
      case MoodPeriod.year:
        moodData = DummyMoodData.yearlyMood;
        break;
    }
    return moodData;
  }
}

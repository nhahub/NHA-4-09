import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/enums/mood_time_range.dart';
import 'mood_graph_builder.dart';
import '../../../../../mood/presentation/manager/mood_progress_cubit/mood_progress_cubit.dart';

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

    return MoodGraphBuilder(period: period);
  }
}

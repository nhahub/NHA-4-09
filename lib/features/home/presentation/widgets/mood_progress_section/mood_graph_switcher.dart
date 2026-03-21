import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/enums/mood_time_range.dart';
import 'mood_graph.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';

class MoodGraphSwitcher extends StatelessWidget {
  const MoodGraphSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodRangeCubit, MoodPeriod>(
      builder: (context, range) {
        return MoodGraph(period: range);
      },
    );
  }
}

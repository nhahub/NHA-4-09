import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/enums/mood_time_range.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'mood_graph/mood_graph.dart';

class MoodGraphSwitcher extends StatelessWidget {
  const MoodGraphSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodRangeCubit, MoodPeriod>(
      builder: (context, period) {
        return MoodGraph(period: period);
      },
    );
  }
}

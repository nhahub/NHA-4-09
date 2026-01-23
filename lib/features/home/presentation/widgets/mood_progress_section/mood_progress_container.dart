import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/static.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'mood_graph_switcher.dart';
import 'mood_range_selector.dart';
import 'mood_recommendations_container.dart';

class MoodProgressBody extends StatelessWidget {
  const MoodProgressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        children: [
          BlocProvider(
            create: (_) => MoodRangeCubit(),
            child: Column(
              children: const [
                MoodRangeSelector(),
                SizedBox(height: 16),
                MoodGraphSwitcher(),
              ],
            ),
          ),
          SizedBox(height: 16),
          MoodRecommendationsContainer(),
        ],
      ),
    );
  }
}

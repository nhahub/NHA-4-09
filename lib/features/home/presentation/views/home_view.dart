import 'package:flutter/material.dart';

import '../../../../core/widgets/vertical_space.dart';
import '../widgets/daily_stats_section/daily_stats_section.dart';
import '../widgets/feeling_today_section/feeling_today_section.dart';
import '../widgets/home_appbar/home_appbar.dart';
import '../widgets/meditations_for_you_section/meditations_for_you_section.dart';
import '../widgets/message_of_the_day_section/message_of_the_day_section.dart';
import '../widgets/mood_progress_section/mood_progress_section.dart';
import '../widgets/sessions_for_you_section/sessions_for_you_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VerticalSpace(),
          HomeAppbar(isPremium: false),
          const VerticalSpace(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const MessageOfTheDaySection(),
                  const VerticalSpace(),
                  const FeelingTodaySection(),
                  const VerticalSpace(),
                  const DailyStatsSection(),
                  const VerticalSpace(),
                  const MoodProgressSection(),
                  const VerticalSpace(),
                  const MeditationsForYouSection(),
                  const VerticalSpace(),
                  const SessionsForYouSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

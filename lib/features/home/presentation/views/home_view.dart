import 'package:flutter/material.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../widgets/daily_stats_section/shared/daily_stats_section.dart';
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
    return const Scaffold(
      body: Column(
        children: [
          VerticalSpace(),
          HomeAppbar(isPremium: false),
          VerticalSpace(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MessageOfTheDaySection(),
                  VerticalSpace(),
                  FeelingTodaySection(),
                  VerticalSpace(),
                  DailyStatsSection(),
                  VerticalSpace(),
                  MoodProgressSection(isPremium: false),
                  VerticalSpace(),
                  MeditationsForYouSection(),
                  VerticalSpace(),
                  SessionsForYouSection(),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

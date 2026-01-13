import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/feeling_today_section/feeling_today_section.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/daily_stats_section/daily_stats_section.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
          child: Column(
            children: [
              SizedBox(height: 60),
              HomeAppbar(isPremium: false),
              SizedBox(height: 20),
              MessageOfTheDaySection(),
              SizedBox(height: 20),
              FeelingTodaySection(),
              SizedBox(height: 20),
              DailyStatsSection(),
              SizedBox(height: 20),
              MoodProgressSection(),
              SizedBox(height: 20),
              MeditationsForYouSection(),
              SizedBox(height: 20),
              SessionsForYouSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

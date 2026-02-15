import 'package:flutter/material.dart';
import 'package:moodly/core/enums/fade_position.dart';
import 'package:moodly/core/widgets/fade_scrollable.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/daily_stats_section.dart';
import 'package:moodly/features/home/presentation/widgets/meditations_for_you_section/meditations_for_you_section.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/message_of_the_day_section.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_progress_section.dart';
import 'package:moodly/features/home/presentation/widgets/sessions_for_you_section/sessions_for_you_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.isPremium});

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return FadeScrollable(
      fadePosition: FadePosition.bottom,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            const SizedBox(height: 60),
            const MessageOfTheDaySection(),
            const DailyStatsSection(),
            MoodProgressSection(isPremium: isPremium),
            const MeditationsForYouSection(),
            const SessionsForYouSection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

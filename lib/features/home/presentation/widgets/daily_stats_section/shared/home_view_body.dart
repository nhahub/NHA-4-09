import 'package:flutter/material.dart';
import '../../../../../../core/enums/fade_position.dart';
import '../../../../../../core/widgets/fade_scrollable.dart';
import 'daily_stats_section.dart';
import '../../meditations_for_you_section/meditations_for_you_section.dart';
import '../../message_of_the_day_section/message_of_the_day_section.dart';
import '../../mood_progress_section/mood_progress_section.dart';
import '../../../../../meals_recommendations/presentation/widgets/recommended_food_section.dart';
import '../../sessions_for_you_section/sessions_for_you_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.isPremium});

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return FadeScrollable(
      fadePosition: FadePosition.bottom,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 140),
          child: Column(
            spacing: 20,
            children: [
              const MessageOfTheDaySection(),
              const DailyStatsSection(),
              const RecommendedFoodSection(),
              MoodProgressSection(isPremium: isPremium),
              const MeditationsForYouSection(),
              const SessionsForYouSection(),
            ],
          ),
        ),
      ),
    );
  }
}

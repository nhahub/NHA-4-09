import 'package:flutter/material.dart';

import '../../../../core/enums/fade_position.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../../../../core/widgets/vertical_space.dart';
import '../widgets/daily_stats_section/shared/daily_stats_section.dart';
import '../widgets/feeling_today_section/feeling_today_section.dart';
import '../widgets/meditations_for_you_section/meditations_for_you_section.dart';
import '../widgets/message_of_the_day_section/message_of_the_day_section.dart';
import '../widgets/mood_progress_section/mood_progress_section.dart';
import '../widgets/sessions_for_you_section/sessions_for_you_section.dart';

class HomeView extends StatelessWidget {
  final bool isPremium = true;
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Home",
        isPremium: isPremium,
        icon: AppAssets.slidersHorizontalIcon,
        onTap: () {},
      ),
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              const MessageOfTheDaySection(),
              const VerticalSpace(),
              const FeelingTodaySection(),
              const VerticalSpace(),
              const DailyStatsSection(),
              const VerticalSpace(),
              MoodProgressSection(isPremium: isPremium),
              const VerticalSpace(),
              const MeditationsForYouSection(),
              const VerticalSpace(),
              const SessionsForYouSection(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}

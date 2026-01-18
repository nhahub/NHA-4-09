import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_cubit.dart';

import '../../../../core/constants/constants.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 60),
            HomeAppbar(isPremium: false),
            const VerticalSpace(),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      context.read<AuthatcationCubit>().logout();
                    },
                    icon: const Icon(Icons.logout, color: Colors.red),
                  ),
                ),
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
                const VerticalSpace(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/manager/mood_range_cubit/mood_range_cubit.dart';
import 'package:moodly/core/widgets/custom_overlay_widget.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/mood_tracker_widget.dart';
import '../../../../../core/constants/constants.dart';
import 'mood_progress_container.dart';
import '../../../../../core/widgets/app_section_header.dart';

class MoodProgressSection extends StatelessWidget {
  final bool isPremium;

  const MoodProgressSection({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodRangeCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSectionHeader(title: "Mood Progress"),
          const SizedBox(height: kAppSectionSpacing),
          isPremium
              ? MoodProgressBody()
              : CustomOverlayWidget(
                  height: 320,
                  padding: kAppSectionSpacing,
                  child: MoodTrackerWidget(),
                ),
        ],
      ),
    );
  }
}

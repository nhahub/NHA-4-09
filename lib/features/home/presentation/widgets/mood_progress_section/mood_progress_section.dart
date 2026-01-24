import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import '../../../../../core/widgets/custom_overlay_widget.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'mood_progress_container.dart';
import 'mood_tracker_widget.dart';

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
              ? const MoodProgressBody()
              : const CustomOverlayWidget(
                  height: 320,
                  padding: kAppSectionSpacing,
                  child: MoodTrackerWidget(),
                ),
        ],
      ),
    );
  }
}

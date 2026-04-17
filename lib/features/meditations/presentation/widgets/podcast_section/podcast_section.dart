import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/presentation/widgets/podcast_section/podcast_bloc_builder.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';

class PodcastSection extends StatelessWidget {
  const PodcastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: kAppSectionSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Podcast"),
        PodcastBlocBuilder(),
      ],
    );
  }
}

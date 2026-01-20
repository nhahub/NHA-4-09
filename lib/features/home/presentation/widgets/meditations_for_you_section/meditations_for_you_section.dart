import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/meditations_for_you_section/meditations_for_you_header.dart';
import 'package:moodly/features/home/presentation/widgets/meditations_for_you_section/meditations_for_you_list_view.dart';

class MeditationsForYouSection extends StatelessWidget {
  const MeditationsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeditationsForYouHeader(),
        SizedBox(height: kAppSectionSpacing),
        MeditationsForYouListView(),
      ],
    );
  }
}

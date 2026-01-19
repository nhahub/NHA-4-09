import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/presentation/widgets/for_difficult_situations_section/for_difficult_situations_list_view.dart';

import '../../../../../core/widgets/app_section_header.dart';

class ForDifficultSituationsSection extends StatelessWidget {
  const ForDifficultSituationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "For difficult situations"),
        const SizedBox(height: kAppSectionSpacing),
        ForDifficultSituationsListView(),
      ],
    );
  }
}

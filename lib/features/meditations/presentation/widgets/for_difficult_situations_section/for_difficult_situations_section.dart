import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'for_difficult_situations_list_view.dart';

class ForDifficultSituationsSection extends StatelessWidget {
  const ForDifficultSituationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "For difficult situations"),
        SizedBox(height: kAppSectionSpacing),
        ForDifficultSituationsListView(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';

import '../../../../../core/widgets/app_section_header.dart';
import 'new_arrivals_grid_view.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "New arrivals"),
        const SizedBox(height: kAppSectionSpacing),
        NewArrivalsGridView(),
      ],
    );
  }
}

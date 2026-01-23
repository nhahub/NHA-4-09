import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';

import '../../../../../core/widgets/app_section_header.dart';
import 'new_arrivals_grid_view.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "New arrivals"),
        SizedBox(height: kAppSectionSpacing),
        NewArrivalsGridView(),
      ],
    );
  }
}

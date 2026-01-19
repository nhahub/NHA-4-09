import 'package:flutter/material.dart';
import 'new_arrivals_grid_view.dart';
import '../../../../../core/widgets/app_section_header.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "New arrivals"),
        NewArrivalsGridView(),
      ],
    );
  }
}

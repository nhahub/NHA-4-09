import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "New arrivals"),
        Container(),
      ],
    );
  }
}

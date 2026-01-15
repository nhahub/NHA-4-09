import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class MeditationsForYouSection extends StatelessWidget {
  const MeditationsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            AppSectionHeader(title: "Meditations for you"),
            Spacer(),
          ],
        ),
        Container(),
      ],
    );
  }
}

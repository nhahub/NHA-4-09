import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class SessionsForYouSection extends StatelessWidget {
  const SessionsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            AppSectionHeader(title: "Sessions for you"),
            Spacer(),
          ],
        ),
        Container(),
      ],
    );
  }
}

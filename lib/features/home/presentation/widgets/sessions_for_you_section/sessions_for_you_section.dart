import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/shared/see_more_widget.dart';

import '../../../../../core/widgets/app_section_header.dart';

class SessionsForYouSection extends StatelessWidget {
  const SessionsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const AppSectionHeader(title: "Sessions for you"),
            const Spacer(),
            SeeMoreWidget(onTap: () {}),
          ],
        ),
        Container(),
      ],
    );
  }
}

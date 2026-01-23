import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';
import '../shared/see_more_widget.dart';

class SessionsForYouHeader extends StatelessWidget {
  const SessionsForYouHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppSectionHeader(title: "Sessions for you"),
        const Spacer(),
        SeeMoreWidget(onTap: () {}),
      ],
    );
  }
}

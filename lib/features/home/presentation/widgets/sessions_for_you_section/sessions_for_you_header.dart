import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/app_section_header.dart';
import 'package:moodly/features/home/presentation/widgets/shared/see_more_widget.dart';

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

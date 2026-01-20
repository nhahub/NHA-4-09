import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/app_section_header.dart';
import 'package:moodly/features/home/presentation/widgets/shared/see_more_widget.dart';

class MeditationsForYouHeader extends StatelessWidget {
  const MeditationsForYouHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppSectionHeader(title: "Meditations for you"),
        const Spacer(),
        SeeMoreWidget(onTap: () {}),
      ],
    );
  }
}

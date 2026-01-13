import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class MessageOfTheDaySection extends StatelessWidget {
  const MessageOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Message of the Day"),
        Container(),
      ],
    );
  }
}

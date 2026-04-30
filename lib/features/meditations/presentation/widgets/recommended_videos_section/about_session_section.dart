import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';
import 'about_session_card.dart';

class AboutSessionSection extends StatelessWidget {
  final String description;

  const AboutSessionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('About this session', style: AppStyles.extraBold18),
        AboutSessionCard(description: description),
      ],
    );
  }
}

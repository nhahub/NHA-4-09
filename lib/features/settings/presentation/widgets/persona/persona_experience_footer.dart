import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';

class PersonaExperienceFooter extends StatelessWidget {
  const PersonaExperienceFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'This experience is personalized based on your emotional preferences.',
      textAlign: TextAlign.center,
      style: AppStyles.regular13.copyWith(
        color: Colors.white.withValues(alpha: .55),
      ),
    );
  }
}

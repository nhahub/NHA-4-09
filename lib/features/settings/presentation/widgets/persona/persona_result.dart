import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/persona_model.dart';
import 'persona_emoji.dart';

class PersonaResult extends StatelessWidget {
  const PersonaResult({super.key, required this.persona});

  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonaEmoji(persona: persona),
        const SizedBox(height: 32),
        Text(
          'You are a',
          style: AppStyles.medium17.copyWith(
            color: Colors.white.withValues(alpha: .7),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          persona.title,
          textAlign: TextAlign.center,
          style: AppStyles.bold34.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          persona.subtitle,
          textAlign: TextAlign.center,
          style: AppStyles.medium16.copyWith(
            color: Colors.white.withValues(alpha: .85),
          ),
        ),
      ],
    );
  }
}

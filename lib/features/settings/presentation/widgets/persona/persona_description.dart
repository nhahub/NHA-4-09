import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';

import '../../../data/models/persona_model.dart';

class PersonaDescription extends StatelessWidget {
  const PersonaDescription({super.key, required this.persona});

  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Text(
        persona.description,
        textAlign: TextAlign.center,
        style: AppStyles.regular16.copyWith(
          color: Colors.white.withValues(alpha: .9),
        ),
      ),
    );
  }
}

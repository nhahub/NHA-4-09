import 'package:flutter/material.dart';

import '../../../data/models/persona_model.dart';

class PersonaFocusAreas extends StatelessWidget {
  const PersonaFocusAreas({super.key, required this.persona});

  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: persona.focusAreas.map((focus) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withValues(alpha: .08)),
          ),
          child: Text(
            focus,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }
}

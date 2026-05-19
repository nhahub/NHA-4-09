import 'package:flutter/material.dart';

import '../../../data/models/persona_model.dart';

class PersonaEmoji extends StatelessWidget {
  const PersonaEmoji({super.key, required this.persona});

  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: .08),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Text(persona.emoji, style: const TextStyle(fontSize: 60)),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../data/models/persona_model.dart';

class PersonaDescription extends StatelessWidget {
  const PersonaDescription({super.key, required this.persona});

  final PersonaModel persona;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .08),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Text(
        persona.description,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withValues(alpha: .9),
          fontSize: 15,
          height: 1.7,
        ),
      ),
    );
  }
}

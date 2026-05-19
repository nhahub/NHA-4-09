import 'package:flutter/material.dart';

class PersonaModel {
  final String title;
  final String emoji;
  final String subtitle;
  final String description;
  final List<String> focusAreas;
  final List<Color> gradient;

  const PersonaModel({
    required this.title,
    required this.emoji,
    required this.subtitle,
    required this.description,
    required this.focusAreas,
    required this.gradient,
  });
}
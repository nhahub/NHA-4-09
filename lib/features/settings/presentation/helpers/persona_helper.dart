import 'package:flutter/material.dart';
import '../../../onboarding/data/models/questionnaire_answers_model.dart';
import '../../data/models/persona_model.dart';

class PersonaHelper {
  static PersonaModel getPersona(
    QuestionnaireAnswersModel answers,
  ) {
    final allAnswers = [
      ...answers.q1,
      ...answers.q2,
      ...answers.q3,
    ];

    final calmSeeker = [
      'stress_anxiety',
      'guided_meditation',
      'sleep_relaxation',
      'emotional_regulation',
    ];

    final growthBuilder = [
      'positivity',
      'healthy_habits',
      'motivation_productivity',
      'self_confidence',
    ];

    final emotionalExplorer = [
      'emotions_understanding',
      'mood_tracking',
      'emotional_regulation',
    ];

    final connectionBuilder = [
      'relationships',
      'community_support',
      'relationships_connections',
    ];

    int countMatches(List<String> tags) {
      return allAnswers.where((e) => tags.contains(e)).length;
    }

    final scores = {
      'calm': countMatches(calmSeeker),
      'growth': countMatches(growthBuilder),
      'emotional': countMatches(emotionalExplorer),
      'connection': countMatches(connectionBuilder),
    };

    final topPersona = scores.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;

    switch (topPersona) {
      case 'growth':
        return const PersonaModel(
          title: 'Growth Builder',
          emoji: '🚀',
          subtitle:
              'You’re focused on becoming a stronger version of yourself.',
          description:
              'You enjoy growth, healthy habits, productivity, and building confidence step by step.',
          focusAreas: [
            'Healthy Habits',
            'Productivity',
            'Self Confidence',
            'Motivation',
          ],
          gradient: [
            Color(0xFF240046),
            Color(0xFFFF6D00),
          ],
        );

      case 'emotional':
        return const PersonaModel(
          title: 'Emotional Explorer',
          emoji: '💙',
          subtitle:
              'You want to better understand your emotions and inner world.',
          description:
              'You value self-awareness, emotional understanding, and reflection in your daily life.',
          focusAreas: [
            'Mood Tracking',
            'Self Awareness',
            'Reflection',
            'Emotional Clarity',
          ],
          gradient: [
            Color(0xFF14213D),
            Color(0xFF1D3557),
          ],
        );

      case 'connection':
        return const PersonaModel(
          title: 'Connection Builder',
          emoji: '🤝',
          subtitle:
              'You value meaningful relationships and emotional connection.',
          description:
              'You care about communication, emotional support, and building stronger relationships.',
          focusAreas: [
            'Relationships',
            'Community',
            'Connection',
            'Communication',
          ],
          gradient: [
            Color(0xFF5F0F40),
            Color(0xFFFF7F51),
          ],
        );

      default:
        return const PersonaModel(
          title: 'Calm Seeker',
          emoji: '🌿',
          subtitle:
              'You’re looking for peace, balance, and emotional calm.',
          description:
              'You value relaxation, emotional balance, and healthier ways to manage stress and anxiety.',
          focusAreas: [
            'Meditation',
            'Relaxation',
            'Better Sleep',
            'Emotional Balance',
          ],
          gradient: [
            Color(0xFF081C15),
            Color(0xFF1B4332),
          ],
        );
    }
  }
}
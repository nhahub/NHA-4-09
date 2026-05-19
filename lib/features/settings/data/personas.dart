import 'package:flutter/material.dart';

import 'models/persona_config.dart';
import 'models/persona_model.dart';

enum PersonaType { calm, growth, emotional, connection }

const Map<PersonaType, PersonaConfig> personas = {
  PersonaType.calm: PersonaConfig(
    tags: {
      'stress_anxiety',
      'guided_meditation',
      'sleep_relaxation',
      'emotional_regulation',
    },
    persona: PersonaModel(
      title: 'Calm Seeker',
      emoji: '🌿',
      subtitle: 'You’re looking for peace, balance, and emotional calm.',
      description:
          'You value relaxation, emotional balance, and healthier ways to manage stress and anxiety.',
      focusAreas: [
        'Meditation',
        'Relaxation',
        'Better Sleep',
        'Emotional Balance',
      ],
      gradient: [Color(0xFF081C15), Color(0xFF1B4332)],
    ),
  ),

  PersonaType.growth: PersonaConfig(
    tags: {
      'positivity',
      'healthy_habits',
      'motivation_productivity',
      'self_confidence',
    },
    persona: PersonaModel(
      title: 'Growth Builder',
      emoji: '🚀',
      subtitle: 'You’re focused on becoming a stronger version of yourself.',
      description:
          'You enjoy growth, healthy habits, productivity, and building confidence step by step.',
      focusAreas: [
        'Healthy Habits',
        'Productivity',
        'Self Confidence',
        'Motivation',
      ],
      gradient: [Color(0xFF240046), Color(0xFFFF6D00)],
    ),
  ),

  PersonaType.emotional: PersonaConfig(
    tags: {'emotions_understanding', 'mood_tracking', 'emotional_regulation'},
    persona: PersonaModel(
      title: 'Emotional Explorer',
      emoji: '💙',
      subtitle: 'You want to better understand your emotions and inner world.',
      description:
          'You value self-awareness, emotional understanding, and reflection in your daily life.',
      focusAreas: [
        'Mood Tracking',
        'Self Awareness',
        'Reflection',
        'Emotional Clarity',
      ],
      gradient: [Color(0xFF14213D), Color(0xFF1D3557)],
    ),
  ),

  PersonaType.connection: PersonaConfig(
    tags: {'relationships', 'community_support', 'relationships_connections'},
    persona: PersonaModel(
      title: 'Connection Builder',
      emoji: '🤝',
      subtitle: 'You value meaningful relationships and emotional connection.',
      description:
          'You care about communication, emotional support, and building stronger relationships.',
      focusAreas: ['Relationships', 'Community', 'Connection', 'Communication'],
      gradient: [Color(0xFF5F0F40), Color(0xFFFF7F51)],
    ),
  ),
};

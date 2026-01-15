import '../../../../core/theming/app_assets.dart';
import 'option_model.dart';
import 'question_model.dart';

class OnboardingQuestionnaire {
  final List<QuestionModel> questions;

  const OnboardingQuestionnaire({required this.questions});
}

const onboardingQuestionnaire = OnboardingQuestionnaire(
  questions: [
    QuestionModel(
      id: "q_1_goal",
      question: "What brings you here?",
      options: [
        OptionModel(
          id: "stress_anxiety",
          title: "I want to manage stress and anxiety better",
          icon: AppAssets.brain,
        ),
        OptionModel(
          id: "relationships",
          title: "I want to improve my relationships",
          icon: AppAssets.relationships,
        ),
        OptionModel(
          id: "emotions_understanding",
          title: "I want to better understand how emotions work",
          icon: AppAssets.emotions,
        ),
        OptionModel(
          id: "positivity",
          title: "I want to feel more positive each day",
          icon: AppAssets.positiveSun,
        ),
        OptionModel(
          id: "something_else_1",
          title: "Something else",
          icon: AppAssets.somethingElse,
        ),
      ],
    ),

    QuestionModel(
      id: "q_2_start",
      question: "How would you like to start?",
      options: [
        OptionModel(
          id: "guided_meditation",
          title: "Guided meditation sessions",
          icon: AppAssets.meditationSessions,
        ),
        OptionModel(
          id: "mood_tracking",
          title: "Mood tracking",
          icon: AppAssets.moodTracking,
        ),
        OptionModel(
          id: "healthy_habits",
          title: "Healthy habits & challenges",
          icon: AppAssets.habits,
        ),
        OptionModel(
          id: "community_support",
          title: "Community and group support",
          icon: AppAssets.community,
        ),
        OptionModel(
          id: "something_else_2",
          title: "Something else",
          icon: AppAssets.somethingElse,
        ),
      ],
    ),

    QuestionModel(
      id: "q_3_focus",
      question: "What should we focus on together?",
      options: [
        OptionModel(
          id: "sleep_relaxation",
          title: "Sleep & relaxation",
          icon: AppAssets.sleep,
        ),
        OptionModel(
          id: "emotional_regulation",
          title: "Emotional regulation",
          icon: AppAssets.emotionalRegulation,
        ),
        OptionModel(
          id: "self_confidence",
          title: "Self-confidence",
          icon: AppAssets.selfConfidence,
        ),
        OptionModel(
          id: "motivation_productivity",
          title: "Motivation & productivity",
          icon: AppAssets.motivation,
        ),
        OptionModel(
          id: "relationships_connections",
          title: "Relationships & connections",
          icon: AppAssets.relationshipsConnections,
        ),
      ],
    ),
  ],
);

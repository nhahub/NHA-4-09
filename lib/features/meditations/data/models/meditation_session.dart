class MeditationSession {
  final String title;
  final String category;
  final int durationSeconds;
  final String? imageUrl;
  final String description;
  final String instructorName;
  final String instructorTitle;
  final String level;
  final String focus;
  final String type;

  const MeditationSession({
    required this.title,
    required this.category,
    required this.durationSeconds,
    this.imageUrl,
    required this.description,
    required this.instructorName,
    this.instructorTitle = 'Meditation Guide',
    required this.level,
    required this.focus,
    required this.type,
  });

  String get formattedDuration {
    final minutes = durationSeconds ~/ 60;
    return '$minutes min';
  }

  String get instructorInitials {
    final parts = instructorName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }
}

/// Default session used when no session is provided.
const kDefaultMeditationSession = MeditationSession(
  title: 'Peaceful Evening Meditation',
  category: 'Anxiety',
  durationSeconds: 720, // 12 minutes
  imageUrl:
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&q=80',
  description:
      'Find peace and calm in this gentle evening meditation designed to help '
      'ease anxiety and prepare your mind for restful sleep. Let go of the '
      "day's worries as you settle into a state of deep relaxation.",
  instructorName: 'Sarah Evans',
  instructorTitle: 'Meditation Guide',
  level: 'Beginner',
  focus: 'Anxiety Relief',
  type: 'Guided Audio',
);

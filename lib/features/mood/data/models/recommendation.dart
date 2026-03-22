class Recommendation {
  final String title;
  final String description;
  final String category; // QuickAction, Body, Mental, Avoid
  final String mood; // Angry, Anxious, Neutral, Calm, Happy
  final bool isFavorite;

  Recommendation({
    required this.title,
    required this.description,
    required this.category,
    required this.mood,
    this.isFavorite = false,
  });
}
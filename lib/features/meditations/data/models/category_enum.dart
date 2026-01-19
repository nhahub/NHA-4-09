enum Category {
  all,
  sleep,
  anxiety,
  focus,
  relaxation,
  selfEsteem,
  motivation,
  shortSleeping,
}

extension CategoryExtension on Category {
  String get title {
    switch (this) {
      case Category.all:
        return "All";
      case Category.sleep:
        return "Sleep";
      case Category.anxiety:
        return "Anxiety";
      case Category.focus:
        return "Focus";
      case Category.relaxation:
        return "Relaxation";
      case Category.selfEsteem:
        return "Self Esteem";
      case Category.motivation:
        return "Motivation";
      case Category.shortSleeping:
        return "Short (<5 min)";
    }
  }
}

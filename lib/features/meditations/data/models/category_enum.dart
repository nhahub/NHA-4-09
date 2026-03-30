enum Category { all, sleep, anxiety, focus, relaxation, motivation }

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
      case Category.motivation:
        return "Motivation";
    }
  }
}

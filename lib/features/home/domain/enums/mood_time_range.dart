enum MoodTimeRange {
  weekly,
  monthly,
  yearly,
}

extension MoodTimeRangeExtension on MoodTimeRange {
  String get title {
    switch (this) {
      case MoodTimeRange.weekly:
        return "Weekly";
      case MoodTimeRange.monthly:
        return "Monthly";
      case MoodTimeRange.yearly:
        return "Yearly";
    }
  }
}
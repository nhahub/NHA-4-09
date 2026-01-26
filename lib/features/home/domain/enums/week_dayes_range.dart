enum WeekDayesRange { mon, tue, wed, thu, fri, sat, sun }

extension WeekDayesRangeExtension on WeekDayesRange {
  String get dayName {
    switch (this) {
      case WeekDayesRange.mon:
        return "Mon";
      case WeekDayesRange.tue:
        return "Tue";
      case WeekDayesRange.wed:
        return "Wed";
      case WeekDayesRange.thu:
        return "Thu";
      case WeekDayesRange.fri:
        return "Fri";
      case WeekDayesRange.sat:
        return "Sat";
      case WeekDayesRange.sun:
        return "Sun";
    }
  }
}

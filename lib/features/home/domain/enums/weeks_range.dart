enum WeeksRange { week1, week2, week3, week4 }

extension WeeksRangeExtension on WeeksRange {
  String get weekNumber {
    switch (this) {
      case WeeksRange.week1:
        return "Week1";
      case WeeksRange.week2:
        return "Week2";
      case WeeksRange.week3:
        return "Week3";
      case WeeksRange.week4:
        return "Week4";
    }
  }
}

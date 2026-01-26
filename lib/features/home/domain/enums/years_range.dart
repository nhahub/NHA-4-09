enum YearsRange { y2026, y2027, y2028, y2029, y2030, y2031, y2032 }

extension YearsRangeExtension on YearsRange {
  String get dayName {
    switch (this) {
      case YearsRange.y2026:
        return "2026";
      case YearsRange.y2027:
        return "2027";
      case YearsRange.y2028:
        return "2028";
      case YearsRange.y2029:
        return "2029";
      case YearsRange.y2030:
        return "2030";
      case YearsRange.y2031:
        return "2031";
      case YearsRange.y2032:
        return "2032";
    }
  }
}

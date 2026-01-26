enum MonthsRange { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

extension MonthsRangeExtension on MonthsRange {
  String get monthName {
    switch (this) {
      case MonthsRange.jan:
        return "January";
      case MonthsRange.feb:
        return "February";
      case MonthsRange.mar:
        return "March";
      case MonthsRange.apr:
        return "April";
      case MonthsRange.may:
        return "May";
      case MonthsRange.jun:
        return "June";
      case MonthsRange.jul:
        return "July";
      case MonthsRange.aug:
        return "August";
      case MonthsRange.sep:
        return "September";
      case MonthsRange.oct:
        return "October";
      case MonthsRange.nov:
        return "November";
      case MonthsRange.dec:
        return "December";
    }
  }
}

extension MonthsRangeShortExtension on MonthsRange {
  String get shortName {
    switch (this) {
      case MonthsRange.jan:
        return "Jan";
      case MonthsRange.feb:
        return "Feb";
      case MonthsRange.mar:
        return "Mar";
      case MonthsRange.apr:
        return "Apr";
      case MonthsRange.may:
        return "May";
      case MonthsRange.jun:
        return "Jun";
      case MonthsRange.jul:
        return "Jul";
      case MonthsRange.aug:
        return "Aug";
      case MonthsRange.sep:
        return "Sep";
      case MonthsRange.oct:
        return "Oct";
      case MonthsRange.nov:
        return "Nov";
      case MonthsRange.dec:
        return "Dec";
    }
  }
}

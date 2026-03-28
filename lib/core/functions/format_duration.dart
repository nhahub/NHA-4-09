String formatDecimalMinutes({required double duration}) {
  final int minutes = duration.floor();
  final int seconds = ((duration - minutes) * 100).round();
  final String secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
  return '$minutes:$secondsStr';
}

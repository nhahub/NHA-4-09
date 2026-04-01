extension DateTimeExtension on DateTime {
  String timeAgo() {
    final Duration diff = DateTime.now().difference(this);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h';
    } else {
      return '${diff.inDays}d';
    }
  }
}
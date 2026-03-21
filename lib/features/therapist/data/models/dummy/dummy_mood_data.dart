import 'dart:math';

import '../../../../../core/theming/app_assets.dart';
import '../../../../mood/data/models/mood_chart.dart';

class DummyMoodData {
  static final Random random = Random();

  /// Fake mood data for week/month/year charts
  static List<MoodChart> weeklyMood = List.generate(
    7,
    (index) => MoodChart(
      label: "Day ${index + 1}",
      value: (random.nextInt(5) + 1).toDouble(),
      emoji: index % 3 == 0
          ? AppAssets.happy
          : index % 3 == 1
          ? AppAssets.happy
          : AppAssets.happy,
    ),
  );

  static List<MoodChart> monthlyMood = List.generate(
    4,
    (index) => MoodChart(
      label: "Week ${index + 1}",
      value: (random.nextInt(5) + 1).toDouble(),
      emoji: index % 2 == 0 ? AppAssets.happy : AppAssets.happy,
    ),
  );

  static List<MoodChart> yearlyMood = List.generate(
    12,
    (index) => MoodChart(
      label: "Month ${index + 1}",
      value: (random.nextInt(5) + 1).toDouble(),
      emoji: index % 4 == 0
          ? AppAssets.happy
          : index % 4 == 1
          ? AppAssets.happy
          : index % 4 == 2
          ? AppAssets.happy
          : AppAssets.happy,
    ),
  );
}

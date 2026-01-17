import 'package:moodly/core/theming/app_assets.dart';

class RecommendedForYouModel {
  final String imagePath;
  final String category;
  final String title;
  final int duration;

  const RecommendedForYouModel({
    required this.imagePath,
    required this.category,
    required this.title,
    required this.duration,
  });
}

const List<RecommendedForYouModel> recommendedForYouData = [
  RecommendedForYouModel(
    imagePath: AppAssets.meditation1,
    category: 'Sleep',
    title: 'Calm breathing for peaceful sleep',
    duration: 12,
  ),
  RecommendedForYouModel(
    imagePath: AppAssets.meditation2,
    category: 'Stress',
    title: 'Get rid of anxious thoughts',
    duration: 9,
  ),
  RecommendedForYouModel(
    imagePath: AppAssets.meditation3,
    category: 'Concentration',
    title: 'Total focus on learning',
    duration: 7,
  ),
];

import '../../../../core/theming/app_assets.dart';
import '../models/meditation_card_model.dart';

const List<MeditationCardModel> recommendedForYouData = [
  MeditationCardModel(
    imagePath: AppAssets.meditation1,
    category: 'Sleep',
    title: 'Calm breathing for peaceful sleep',
    duration: 12,
  ),
  MeditationCardModel(
    imagePath: AppAssets.meditation2,
    category: 'Stress',
    title: 'Get rid of anxious thoughts',
    duration: 9,
  ),
  MeditationCardModel(
    imagePath: AppAssets.meditation3,
    category: 'Concentration',
    title: 'Total focus on learning',
    duration: 7,
  ),
];

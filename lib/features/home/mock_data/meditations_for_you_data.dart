import 'package:moodly/features/meditations/data/models/meditation_card_model.dart';
import '../../../../core/theming/app_assets.dart';

const List<MeditationCardModel> meditationsForYouData = [
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

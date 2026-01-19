import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/meditations/data/models/meditation_card_model.dart';

const List<MeditationCardModel> newArrivalsData = [
  MeditationCardModel(
    imagePath: AppAssets.newArrival1,
    category: 'Reset',
    title: "Coming back after a hard day.",
    duration: 12,
  ),
  MeditationCardModel(
    imagePath: AppAssets.newArrival2,
    category: 'Clarity',
    title: 'Weekend mental cleansing.',
    duration: 9,
  ),
  MeditationCardModel(
    imagePath: AppAssets.newArrival3,
    category: 'Anxiety',
    title: 'Before an exam or interview.',
    duration: 5,
  ),
  MeditationCardModel(
    imagePath: AppAssets.newArrival4,
    category: 'Sleep',
    title: 'Positive thoughts before sleep.',
    duration: 7,
  ),
];

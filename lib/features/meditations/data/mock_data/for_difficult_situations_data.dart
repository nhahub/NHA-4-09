import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/meditations/data/models/meditation_card_model.dart';

const List<MeditationCardModel> forDifficultSituationsData = [
  MeditationCardModel(
    imagePath: AppAssets.situation1,
    category: 'Anxiety',
    title: "When you don't want to talk to anyone.",
    duration: 6,
  ),
  MeditationCardModel(
    imagePath: AppAssets.situation2,
    category: 'Anxiety',
    title: 'A breath at the right time.',
    duration: 4,
  ),
  MeditationCardModel(
    imagePath: AppAssets.situation3,
    category: 'Emotional validation',
    title: 'You are allowed to feel what you feel.',
    duration: 9,
  ),
  MeditationCardModel(
    imagePath: AppAssets.situation4,
    category: 'Heaviness',
    title: 'A guide for moments when everything is too much.',
    duration: 10,
  ),
  MeditationCardModel(
    imagePath: AppAssets.situation5,
    category: 'Apathy',
    title: 'For days without energy.',
    duration: 5,
  ),
];

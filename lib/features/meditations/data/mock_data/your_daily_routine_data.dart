import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/meditations/data/models/meditation_card_model.dart';

const List<MeditationCardModel> yourDailyRoutineData = [
  MeditationCardModel(
    imagePath: AppAssets.routine1,
    category: 'Motivation',
    title: 'Gentle start to the morning.',
    duration: 6,
  ),
  MeditationCardModel(
    imagePath: AppAssets.routine2,
    category: 'Reset',
    title: 'Mental break in the middle of the day.',
    duration: 5,
  ),
  MeditationCardModel(
    imagePath: AppAssets.routine3,
    category: 'Mindfulness',
    title: '5 minutes for you.',
    duration: 5,
  ),
  MeditationCardModel(
    imagePath: AppAssets.routine4,
    category: 'Sleep',
    title: 'Calm and stress-free evening.',
    duration: 7,
  ),
];

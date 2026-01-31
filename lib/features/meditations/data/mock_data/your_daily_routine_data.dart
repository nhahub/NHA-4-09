import 'package:moodly/features/meditations/domain/video_entity.dart';
import '../../../../core/theming/app_assets.dart';

const List<VideoEntity> yourDailyRoutineData = [
  VideoEntity(
    coverUrl: AppAssets.routine1,
    category: 'Motivation',
    title: 'Gentle start to the morning.',
    duration: 6,
    videoUrl: "",
  ),
  VideoEntity(
    coverUrl: AppAssets.routine2,
    category: 'Reset',
    title: 'Mental break in the middle of the day.',
    duration: 5,
    videoUrl: "",
  ),
  VideoEntity(
    coverUrl: AppAssets.routine3,
    category: 'Mindfulness',
    title: '5 minutes for you.',
    duration: 5,
    videoUrl: "",
  ),
  VideoEntity(
    coverUrl: AppAssets.routine4,
    category: 'Sleep',
    title: 'Calm and stress-free evening.',
    duration: 7,
    videoUrl: "",
  ),
];

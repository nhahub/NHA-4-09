import 'package:moodly/features/meditations/domain/audio_entity.dart';
import '../../../../core/theming/app_assets.dart';

const List<AudioEntity> newArrivalsData = [
  AudioEntity(
    coverUrl: AppAssets.newArrival1,
    category: 'Reset',
    title: "Coming back after a hard day.",
    duration: 12,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.newArrival2,
    category: 'Clarity',
    title: 'Weekend mental cleansing.',
    duration: 9,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.newArrival3,
    category: 'Anxiety',
    title: 'Before an exam or interview.',
    duration: 5,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.newArrival4,
    category: 'Sleep',
    title: 'Positive thoughts before sleep.',
    duration: 7,
    audioUrl: "",
  ),
];

import '../../domain/audio_entity.dart';
import '../../../../core/theming/app_assets.dart';

const List<AudioEntity> forDifficultSituationsData = [
  AudioEntity(
    coverUrl: AppAssets.situation1,
    category: 'Anxiety',
    title: "When you don't want to talk to anyone.",
    duration: 6,
    audioUrl:
        "https://bgvufvgufbeoojigmloh.supabase.co/storage/v1/object/public/audios/birds-forest-nature-445379.mp3",
  ),
  AudioEntity(
    coverUrl: AppAssets.situation2,
    category: 'Anxiety',
    title: 'A breath at the right time.',
    duration: 4,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.situation3,
    category: 'Emotional validation',
    title: 'You are allowed to feel what you feel.',
    duration: 9,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.situation4,
    category: 'Heaviness',
    title: 'A guide for moments when everything is too much.',
    duration: 10,
    audioUrl: "",
  ),
  AudioEntity(
    coverUrl: AppAssets.situation5,
    category: 'Apathy',
    title: 'For days without energy.',
    duration: 5,
    audioUrl: "",
  ),
];

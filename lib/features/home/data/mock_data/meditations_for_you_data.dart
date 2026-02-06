import '../../../meditations/domain/video_entity.dart';
import '../../../../../core/theming/app_assets.dart';

const List<VideoEntity> meditationsForYouData = [
  VideoEntity(
    coverUrl: AppAssets.meditation1,
    category: 'Sleep',
    title: 'Calm breathing for peaceful sleep',
    duration: 12,
    videoUrl: "",
  ),
  VideoEntity(
    coverUrl: AppAssets.meditation2,
    category: 'Stress',
    title: 'Get rid of anxious thoughts',
    duration: 9,
    videoUrl: "",
  ),
  VideoEntity(
    coverUrl: AppAssets.meditation3,
    category: 'Concentration',
    title: 'Total focus on learning',
    duration: 7,
    videoUrl: "",
  ),
];

import '../../../../../core/theming/app_assets.dart';
import '../video_model.dart';

class DummyVideos {
  static List<VideoModel> dummyVideos = List.generate(
    5,
    (index) => VideoModel(
      id: "audio_$index",
      title: "Relaxing Sound $index",
      videoUrl: "",
      coverUrl: AppAssets.dummyImage,
      duration: 180 + index * 15,
      category: "Meditation",
      description: "",
      createdAt: "",
    ),
  );
}

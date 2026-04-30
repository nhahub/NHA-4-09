import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/video_model.dart';
import '../widgets/recommended_videos_section/about_session_section.dart';
import '../widgets/recommended_videos_section/session_details_section.dart';
import '../widgets/recommended_videos_section/video_section.dart';

class VideoView extends StatelessWidget {
  final VideoModel videoModel;

  const VideoView({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: const BackButtonAppbar(title: "Session"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoSection(videoModel: videoModel),
            const SizedBox(height: 28),
            AboutSessionSection(description: videoModel.description),
            const SizedBox(height: 24),
            SessionDetailsSection(videoModel: videoModel),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/models/video_model.dart';

class RecommendedVideosListView extends StatelessWidget {
  final List<VideoModel> recommendedVideos;
  final bool isLoading;
  const RecommendedVideosListView({
    super.key,
    this.isLoading = false,
    required this.recommendedVideos,
  });
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: recommendedVideos.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: recommendedVideos[index],
          onTap: () {
            context.push(Routes.videoView, args: recommendedVideos[index]);
          },
        );
      },
    );
  }
}

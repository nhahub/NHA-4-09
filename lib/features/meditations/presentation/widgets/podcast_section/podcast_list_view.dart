import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/models/audio_model.dart';

class PodcastListView extends StatelessWidget {
  final List<AudioModel> podcastTracks;
  final bool isLoading;

  const PodcastListView({
    super.key,
    this.isLoading = false,
    required this.podcastTracks,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: podcastTracks.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: podcastTracks[index],
          onTap: () {
            context.push(Routes.audioView, args: podcastTracks[index]);
          },
        );
      },
    );
  }
}

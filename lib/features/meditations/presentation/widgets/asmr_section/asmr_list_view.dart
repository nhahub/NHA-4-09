import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/models/audio_model.dart';

class AsmrListView extends StatelessWidget {
  final List<AudioModel> tracks;
  final bool isLoading;
  const AsmrListView({super.key, this.isLoading = false, required this.tracks});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: tracks[index],
          onTap: () {
            context.push(Routes.audioView, args: tracks[index]);
          },
        );
      },
    );
  }
}

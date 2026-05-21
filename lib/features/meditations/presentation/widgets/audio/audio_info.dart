import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/audio_model.dart';

class AudioInfo extends StatelessWidget {
  final AudioModel audioModel;
  const AudioInfo({super.key, required this.audioModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: audioModel.coverUrl,
          imageBuilder: (context, imageProvider) => Container(
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey,
            ),
            child: const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 20),
        // Song Title
        Text(audioModel.title, softWrap: true, style: AppStyles.extraBold17),
      ],
    );
  }
}

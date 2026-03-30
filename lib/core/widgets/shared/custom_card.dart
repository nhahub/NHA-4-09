import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/shared/adaptive_image.dart';

import '../../models/media_model.dart';
import 'card_description_container.dart';
import 'category_container.dart';
import 'play_button.dart';

class CustomCard extends StatelessWidget {
  final MediaModel mediaEntity;
  final VoidCallback? onTap;
  final double? cardWidth;

  const CustomCard({
    super.key,
    required this.mediaEntity,
    required this.onTap,
    this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    final width = cardWidth ?? 242;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            AdaptiveImage(
              imageUrl: mediaEntity.coverUrl,
              width: width,
              height: double.infinity,
              borderRadius: BorderRadius.circular(16),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CardDescriptionContainer(
                title: mediaEntity.title,
                duration: mediaEntity.duration,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: CategoryContainer(categoryTitle: mediaEntity.category),
            ),
            const Center(child: PlayButton()),
          ],
        ),
      ),
    );
  }
}

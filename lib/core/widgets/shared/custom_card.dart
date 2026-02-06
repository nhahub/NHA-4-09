import 'package:flutter/material.dart';

import '../../entities/media_entity.dart';
import 'card_description_container.dart';
import 'category_container.dart';
import 'play_button.dart';

class CustomCard extends StatelessWidget {
  final MediaEntity mediaEntity;
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth ?? 242,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(mediaEntity.coverUrl),
            fit: BoxFit.cover,
          ),
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
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

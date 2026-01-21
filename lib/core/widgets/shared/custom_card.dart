import 'package:flutter/material.dart';

import '../../../features/meditations/data/models/meditation_card_model.dart';
import 'card_description_container.dart';
import 'category_container.dart';
import 'play_button.dart';

class CustomCard extends StatelessWidget {
  final MeditationCardModel meditationCardModel;
  final VoidCallback? onTap;
  final double? cardWidth;

  const CustomCard({
    super.key,
    required this.meditationCardModel,
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
            image: AssetImage(meditationCardModel.imagePath),
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
                title: meditationCardModel.title,
                duration: meditationCardModel.duration,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryContainer(
                    categoryTitle: meditationCardModel.category,
                  ),
                  SizedBox(height: 35),
                  Center(child: PlayButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

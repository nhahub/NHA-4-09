import 'dart:math';
import 'package:flutter/material.dart';
import 'main_card.dart';
import 'rotated_gradient_card.dart';
import 'rotated_inner_shadow_card.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';

class MessageOfTheDaySection extends StatelessWidget {
  static const cardHeight = 180.0;
  static const cardRadius = 20.0;
  static const rotationAngle = 3 * pi / 180;
  static const translateOffset = Offset(0, -10);

  final String quote =
      "Don't waste time knocking on the wall, hoping to turn it into a door.";
  final String author = "Coco Chanel";

  const MessageOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Message of the Day"),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Stack(
            children: [
              const RotatedGradientCard(),
              const RotatedInnerShadowCard(),
              MainCard(quote: quote, author: author),
            ],
          ),
        ),
      ],
    );
  }
}

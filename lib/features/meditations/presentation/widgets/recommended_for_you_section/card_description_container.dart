import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/description_data.dart';

class CardDescriptionContainer extends StatelessWidget {
  final String title;
  final int duration;

  const CardDescriptionContainer({
    super.key,
    required this.title,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 10.0,
              tileMode: TileMode.decal,
            ),
            child: Opacity(
              opacity: 0.0,
              child: DescriptionData(title: title, duration: duration),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withAlpha(alphaFromPercentage(70)),
                ],
              ),
            ),
          ),
        ),
        DescriptionData(title: title, duration: duration),
      ],
    );
  }
}

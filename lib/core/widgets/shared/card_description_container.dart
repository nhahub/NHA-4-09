import 'dart:ui';
import 'package:flutter/material.dart';
import '../../helpers/alpha_from_percent.dart';
import 'description_data.dart';

class CardDescriptionContainer extends StatelessWidget {
  final String title;
  final int? duration;
  final bool? withDuration;
  final TextStyle? titleStyle;

  const CardDescriptionContainer({
    super.key,
    required this.title,
    this.duration,
    this.withDuration = true,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
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
              child: DescriptionData(
                title: title,
                duration: withDuration == false ? 0 : duration!,
              ),
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
        DescriptionData(
          title: title,
          duration: duration ?? 0,
          withDuration: withDuration,
          titleStyle: titleStyle,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_styles.dart' show AppStyles;

class DescriptionData extends StatelessWidget {
  const DescriptionData({
    super.key,
    required this.title,
    required this.duration,
  });

  final String title;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppStyles.extraBold15WithShadow.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "$duration minutes",
            style: AppStyles.medium14WithShadow.copyWith(
              color: Colors.white.withAlpha(alphaFromPercentage(80)),
            ),
          ),
        ],
      ),
    );
  }
}

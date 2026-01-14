import 'package:flutter/material.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';

class CardContant extends StatelessWidget {
  const CardContant({super.key, required this.quote, required this.author});

  final String quote;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '"$quote"',
          style: AppStyles.extraBold20WithShadow.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          "— $author",
          style: AppStyles.extraBold16.copyWith(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(70)),
          ),
        ),
      ],
    );
  }
}

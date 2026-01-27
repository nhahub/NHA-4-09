import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/quote_model.dart';

class CardContant extends StatelessWidget {
  const CardContant({super.key, required this.dailyQuote});
  final Quote dailyQuote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '"${dailyQuote.quote}"',
          style: AppStyles.extraBold20WithShadow.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          "— ${dailyQuote.author}",
          style: AppStyles.extraBold16.copyWith(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(70)),
          ),
        ),
      ],
    );
  }
}

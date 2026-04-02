import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/quote/quote_model.dart';

class CardQuote extends StatelessWidget {
  final bool isExpanded;
  final QuoteModel dailyQuote;
  final VoidCallback? onTap;
  const CardQuote({
    super.key,
    required this.dailyQuote,
    required this.isExpanded,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '"${dailyQuote.quote}"',
              maxLines: isExpanded ? null : 3,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: AppStyles.extraBold20WithShadow.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "— ${dailyQuote.author}",
              style: AppStyles.extraBold16.copyWith(
                color: AppColors.borderButton.withAlpha(
                  alphaFromPercentage(70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

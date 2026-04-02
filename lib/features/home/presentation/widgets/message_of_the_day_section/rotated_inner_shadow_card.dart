import 'package:flutter/material.dart';
import 'loading_card.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/quote/quote_model.dart';
import 'card_quote.dart';
import 'message_of_the_day_section.dart';

class RotatedInnerShadowCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback? onTap;
  final bool isLoading;

  final QuoteModel dailyQuote;
  const RotatedInnerShadowCard({
    super.key,
    required this.dailyQuote,
    this.isLoading = false,
    required this.isExpanded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: MessageOfTheDaySection.rotationAngle,
      child: Transform.translate(
        offset: MessageOfTheDaySection.translateOffset,
        child: isLoading
            ? LoadingCard(dailyQuote: dailyQuote)
            : Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    MessageOfTheDaySection.cardRadius,
                  ),
                  color: AppColors.borderButton.withAlpha(
                    alphaFromPercentage(12),
                  ),
                ),
                child: Opacity(
                  opacity: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 30,
                    ),
                    child: CardQuote(
                      dailyQuote: dailyQuote,
                      isExpanded: isExpanded,
                      onTap: onTap,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

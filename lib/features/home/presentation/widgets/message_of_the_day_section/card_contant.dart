import 'package:flutter/material.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../data/models/quote/quote_model.dart';
import 'card_dot.dart';
import 'card_quote.dart';

class CardContant extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback? onTap;
  final QuoteModel dailyQuote;

  const CardContant({
    super.key,
    required this.dailyQuote,
    required this.isExpanded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -30,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.7,
            child: Image.asset(AppAssets.cardEffect, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CardDot(), CardDot()],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                child: CardQuote(
                  dailyQuote: dailyQuote,
                  isExpanded: isExpanded,
                  onTap: onTap,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CardDot(), CardDot()],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

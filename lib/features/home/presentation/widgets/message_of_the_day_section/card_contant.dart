import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/home/data/models/quote/quote_model.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/card_dot.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/card_quote.dart';

class CardContant extends StatelessWidget {
  const CardContant({super.key, required this.dailyQuote});

  final QuoteModel dailyQuote;

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
                child: CardQuote(dailyQuote: dailyQuote),
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

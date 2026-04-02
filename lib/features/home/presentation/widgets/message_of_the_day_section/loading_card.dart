import 'package:flutter/material.dart';
import '../../../data/models/quote/quote_model.dart';
import 'card_quote.dart';
import 'message_of_the_day_section.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key, required this.dailyQuote});

  final QuoteModel dailyQuote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MessageOfTheDaySection.cardRadius),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CardQuote(
            dailyQuote: dailyQuote,
            isExpanded: false,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

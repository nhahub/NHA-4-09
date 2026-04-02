import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/card_contant.dart';
import 'package:moodly/features/home/presentation/widgets/message_of_the_day_section/loading_card.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/quote/quote_model.dart';
import 'message_of_the_day_section.dart';

class MainCard extends StatelessWidget {
  final bool isLoading;
  final QuoteModel dailyQuote;
  const MainCard({super.key, required this.dailyQuote, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingCard(dailyQuote: dailyQuote)
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MessageOfTheDaySection.cardRadius,
              ),
              border: Border.all(color: AppColors.brandGreen, width: 2),
              gradient: const LinearGradient(
                colors: [AppColors.lightGreen, AppColors.brandGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: CardContant(dailyQuote: dailyQuote),
          );
  }
}

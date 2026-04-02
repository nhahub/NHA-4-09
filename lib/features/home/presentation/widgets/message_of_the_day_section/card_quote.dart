import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/quote/quote_model.dart';

class CardQuote extends StatefulWidget {
  const CardQuote({super.key, required this.dailyQuote});
  final QuoteModel dailyQuote;

  @override
  State<CardQuote> createState() => _CardQuoteState();
}

class _CardQuoteState extends State<CardQuote> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '"${widget.dailyQuote.quote}"',
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
              "— ${widget.dailyQuote.author}",
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

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/quote/quote_model.dart';
import 'main_card.dart';
import 'rotated_gradient_card.dart';
import 'rotated_inner_shadow_card.dart';

class QuoteShape extends StatelessWidget {
  final QuoteModel dailyQuote;
  final bool isLoading;
  const QuoteShape({
    super.key,
    required this.dailyQuote,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: Stack(
        children: [
          RotatedGradientCard(dailyQuote: dailyQuote),
          RotatedInnerShadowCard(dailyQuote: dailyQuote),
          MainCard(dailyQuote: dailyQuote),
        ],
      ),
    );
  }
}

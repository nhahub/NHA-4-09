import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/quote/quote_model.dart';
import 'main_card.dart';
import 'rotated_gradient_card.dart';
import 'rotated_inner_shadow_card.dart';

class QuoteShape extends StatefulWidget {
  final QuoteModel dailyQuote;
  final bool isLoading;
  const QuoteShape({
    super.key,
    required this.dailyQuote,
    this.isLoading = false,
  });

  @override
  State<QuoteShape> createState() => _QuoteShapeState();
}

class _QuoteShapeState extends State<QuoteShape> {
  bool isExpanded = false;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: widget.isLoading,
      child: Stack(
        children: [
          RotatedGradientCard(
            dailyQuote: widget.dailyQuote,
            isLoading: widget.isLoading,
            isExpanded: isExpanded,
          ),
          RotatedInnerShadowCard(
            dailyQuote: widget.dailyQuote,
            isLoading: widget.isLoading,
            isExpanded: isExpanded,
          ),
          MainCard(
            dailyQuote: widget.dailyQuote,
            isLoading: widget.isLoading,
            isExpanded: isExpanded,
            onTap: toggle,
          ),
        ],
      ),
    );
  }
}

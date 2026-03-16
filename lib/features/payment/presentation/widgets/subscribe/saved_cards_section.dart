import 'package:flutter/material.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/card_model.dart';
import '../payment_method_item.dart';

class SavedCardsSection extends StatelessWidget {
  final List<CardModel> savedCards;
  final int selectedMethodIndex;
  final int selectedSavedCardIndex;
  final Function(int) onCardSelected;

  const SavedCardsSection({
    super.key,
    required this.savedCards,
    required this.selectedMethodIndex,
    required this.selectedSavedCardIndex,
    required this.onCardSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (savedCards.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          "Payment with debit/credit card",
          style: AppStyles.extraBold16,
        ),
        const SizedBox(height: 16),
        ...List.generate(savedCards.length, (index) {
          return PaymentMethodItem(
            title: savedCards[index].maskedNumber,
            iconPath: AppAssets.cardDotIcon,
            isSelected:
                selectedMethodIndex == 3 && selectedSavedCardIndex == index,
            onTap: () => onCardSelected(index),
          );
        }),
      ],
    );
  }
}

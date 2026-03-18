import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/subscribe_mapper.dart';
import '../../manager/payment_cubit/payment_cubit.dart';
import '../add_card/card_preview.dart';
import 'payment_methods_section.dart';
import 'saved_cards_section.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../data/models/card_model.dart';
import '../../manager/payment_cubit/payment_state.dart';

class SubscribeContent extends StatelessWidget {
  final double price;
  final PaymentState state;

  const SubscribeContent({super.key, required this.price, required this.state});

  @override
  Widget build(BuildContext context) {
    final data = SubscribeMapper.map(state);
    final currentCard = SubscribeMapper.getCurrentCard(data);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentCard != null)
            CardPreview(
              holderName: currentCard.holderName,
              cardNumber: currentCard.cardNumber,
            ),

          PaymentMethodsSection(
            selectedMethodIndex: data.selectedMethodIndex,
            onMethodSelected: (index) =>
                context.read<PaymentCubit>().selectMethod(index),
            onAddCardTap: () async {
              final result = await context.push(Routes.addCardView);
              if (result is CardModel) {
                // ignore: use_build_context_synchronously
                context.read<PaymentCubit>().addCard(result);
              }
            },
          ),

          SavedCardsSection(
            savedCards: data.savedCards,
            selectedMethodIndex: data.selectedMethodIndex,
            selectedSavedCardIndex: data.selectedSavedCardIndex,
            onCardSelected: (index) =>
                context.read<PaymentCubit>().selectCard(index),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

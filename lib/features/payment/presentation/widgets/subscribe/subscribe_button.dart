import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_button.dart';
import '../../helpers/payment_handler.dart';
import '../../helpers/subscribe_mapper.dart';
import '../../manager/payment_cubit/payment_state.dart';

class SubscribeButton extends StatelessWidget {
  final double price;
  final PaymentState state;

  const SubscribeButton({super.key, required this.price, required this.state});

  @override
  Widget build(BuildContext context) {
    final data = SubscribeMapper.map(state);
    final currentCard = SubscribeMapper.getCurrentCard(data);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: AppTextButton(
            onPressed: () => PaymentHandler.handle(
              context: context,
              price: price,
              selectedMethodIndex: data.selectedMethodIndex,
              currentCard: currentCard,
            ),
            buttonText: "Continue",
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../data/models/paybal/payment_transaction_model.dart';
import '../../../data/models/payment_transaction_mock.dart';
import '../../helpers/execute_paymob_payment.dart';
import '../../helpers/execute_paypal_payment.dart';
import '../../helpers/execute_stripe_payment.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../data/models/card_model.dart';
import '../../manager/payment_cubit/payment_cubit.dart';
import '../../manager/payment_cubit/payment_state.dart';
import '../add_card/card_preview.dart';
import '../payment_success_dialog.dart';
import 'payment_methods_section.dart';
import 'saved_cards_section.dart';

class SubscribeViewBody extends StatelessWidget {
  final double price;
  const SubscribeViewBody({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccessState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const PaymentSuccessDialog(),
          );
        } else if (state is PaymentFailureState) {
          errorDialog(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        // Default values
        List<CardModel> savedCards = [];
        int selectedMethodIndex = -1;
        int selectedSavedCardIndex = -1;

        if (state is PaymentUpdatedState) {
          savedCards = state.savedCards;
          selectedMethodIndex = state.selectedMethodIndex;
          selectedSavedCardIndex = state.selectedSavedCardIndex;
        }

        final currentCard =
            (selectedMethodIndex == 3 &&
                selectedSavedCardIndex != -1 &&
                savedCards.length > selectedSavedCardIndex)
            ? savedCards[selectedSavedCardIndex]
            : null;

        return Stack(
          children: [
            SingleChildScrollView(
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
                    selectedMethodIndex: selectedMethodIndex,
                    onMethodSelected: (index) =>
                        context.read<PaymentCubit>().selectMethod(index),
                    onAddCardTap: () async {
                      final result = await context.push(Routes.addCardView);
                      if (result != null && result is CardModel) {
                        // ignore: use_build_context_synchronously
                        context.read<PaymentCubit>().addCard(result);
                      }
                    },
                  ),

                  SavedCardsSection(
                    savedCards: savedCards,
                    selectedMethodIndex: selectedMethodIndex,
                    selectedSavedCardIndex: selectedSavedCardIndex,
                    onCardSelected: (index) =>
                        context.read<PaymentCubit>().selectCard(index),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),

            if (state is PaymentLoadingState)
              const Center(
                child: CustomCircularProgressIndicator(
                  color: AppColors.lightGreen,
                ),
              ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      if (selectedMethodIndex == 3 && currentCard == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select or add a card first"),
                          ),
                        );
                        return;
                      }

                      switch (selectedMethodIndex) {
                        case 0:
                          final mockPayment = PaymentTransactionMock
                              .mockPaymentTransactionModel;
                          executePayPalPayment(
                            context: context,
                            paymentTransactionModel: PaymentTransactionModel(
                              amount: mockPayment.amount,
                              description: "Subscribe",
                              itemList: mockPayment.itemList,
                            ),
                          );
                          break;
                        case 1:
                          executeStripePayment(context: context, price: price);
                          break;
                        case 2:
                          executePaymobPayment(
                            context: context,
                            currentCard: currentCard,
                            price: price,
                          );
                          break;
                      }
                    },
                    buttonText: "Continue",
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

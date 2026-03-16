import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../data/models/card_model.dart';
import '../../manager/payment_cubit/payment_cubit.dart';
import '../../manager/payment_cubit/payment_state.dart';
import '../add_card/card_preview.dart';
import '../payment_success_dialog.dart';
import 'payment_methods_section.dart';
import 'saved_cards_section.dart';

class SubscribeViewBody extends StatefulWidget {
  final double price;
  const SubscribeViewBody({super.key, required this.price});

  @override
  State<SubscribeViewBody> createState() => _SubscribeViewBodyState();
}

class _SubscribeViewBodyState extends State<SubscribeViewBody> {
  int selectedMethodIndex = 0;
  List<CardModel> savedCards = [];
  int selectedSavedCardIndex = -1;
  bool isLoadingCards = true;

  @override
  void initState() {
    super.initState();
    _loadSavedCards();
  }

  Future<void> _loadSavedCards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cardsJson = prefs.getString('saved_cards');
      if (cardsJson != null) {
        setState(() {
          savedCards = CardModel.decode(cardsJson);
          if (savedCards.isNotEmpty) {
            selectedMethodIndex = 3;
            selectedSavedCardIndex = 0;
          }
        });
      }
    } catch (e) {
      debugPrint("Error loading cards: $e");
    } finally {
      setState(() => isLoadingCards = false);
    }
  }

  Future<void> _saveCards() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_cards', CardModel.encode(savedCards));
  }

  @override
  Widget build(BuildContext context) {
    CardModel? currentCard =
        (selectedMethodIndex == 3 &&
            selectedSavedCardIndex != -1 &&
            savedCards.length > selectedSavedCardIndex)
        ? savedCards[selectedSavedCardIndex]
        : null;

    if (isLoadingCards) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const PaymentSuccessDialog(),
          );
        } else if (state is PaymentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dynamic Card Preview
                  if (currentCard != null)
                    CardPreview(
                      holderName: currentCard.holderName,
                      cardNumber: currentCard.cardNumber,
                    ),

                  // Payment Methods Section
                  PaymentMethodsSection(
                    selectedMethodIndex: selectedMethodIndex,
                    onMethodSelected: (index) {
                      setState(() {
                        selectedMethodIndex = index;
                        selectedSavedCardIndex = -1;
                      });
                    },
                    onAddCardTap: () async {
                      final result = await context.push(Routes.addCardView);
                      if (result != null && result is CardModel) {
                        setState(() {
                          savedCards.add(result);
                          selectedMethodIndex = 3;
                          selectedSavedCardIndex = savedCards.length - 1;
                        });
                        _saveCards();
                      }
                    },
                  ),

                  // Saved Cards Section
                  SavedCardsSection(
                    savedCards: savedCards,
                    selectedMethodIndex: selectedMethodIndex,
                    selectedSavedCardIndex: selectedSavedCardIndex,
                    onCardSelected: (index) {
                      setState(() {
                        selectedMethodIndex = 3;
                        selectedSavedCardIndex = index;
                      });
                    },
                  ),

                  const SizedBox(height: 100), // Space for button
                ],
              ),
            ),

            if (state is PaymentLoading)
              const Center(child: CircularProgressIndicator()),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
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

                      context.read<PaymentCubit>().initiatePayment(
                        context: context,
                        amount: widget.price,
                        firstName:
                            currentCard?.holderName.split(" ").first ?? "User",
                        lastName: currentCard?.holderName.contains(" ") == true
                            ? currentCard!.holderName.split(" ").last
                            : "Name",
                        email: "user@example.com",
                        phoneNumber: "+201234567890",
                      );
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

import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_button.dart';
import '../../../data/models/card_model.dart';
import 'card_preview.dart';
import 'custom_card_text_field.dart';

class AddCardViewBody extends StatefulWidget {
  const AddCardViewBody({super.key});

  @override
  State<AddCardViewBody> createState() => _AddCardViewBodyState();
}

class _AddCardViewBodyState extends State<AddCardViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    holderNameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Card Preview Section
            CardPreview(
              holderName: holderNameController.text,
              cardNumber: cardNumberController.text,
            ),

            // Form Fields Section
            CustomCardTextField(
              controller: holderNameController,
              hint: "Hazem Hamdy",
              label: "Holder Name",
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 16),
            CustomCardTextField(
              controller: cardNumberController,
              hint: "1234 5678 1234 5678",
              label: "Card Number",
              keyboardType: TextInputType.number,
              onChanged: (v) => setState(() {}),
              validator: (value) {
                if (value == null || value.isEmpty) return "Enter card number";
                if (value.replaceAll(" ", "").length < 16) {
                  return "Incomplete number";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomCardTextField(
                    controller: expiryController,
                    hint: "02/30",
                    label: "Expiry Date",
                    keyboardType: TextInputType.datetime,
                    onChanged: (v) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Required";
                      if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                        return "Use MM/YY";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomCardTextField(
                    controller: cvvController,
                    hint: "123",
                    label: "CVV",
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    onChanged: (v) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Required";
                      if (value.length < 3) return "Too short";
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newCard = CardModel(
                      holderName: holderNameController.text,
                      cardNumber: cardNumberController.text,
                      expiryDate: expiryController.text,
                      cvv: cvvController.text,
                    );
                    Navigator.pop(context, newCard);
                  }
                },
                buttonText: "Add New Card",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

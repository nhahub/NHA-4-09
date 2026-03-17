import 'package:flutter/material.dart';
import '../../../data/models/payment_method_model.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../payment_method_item.dart';

class PaymentMethodsSection extends StatelessWidget {
  final int selectedMethodIndex;
  final Function(int) onMethodSelected;
  final VoidCallback onAddCardTap;

  const PaymentMethodsSection({
    super.key,
    required this.selectedMethodIndex,
    required this.onMethodSelected,
    required this.onAddCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Payment Methods", style: AppStyles.extraBold16),
            TextButton(
              onPressed: onAddCardTap,
              child: const Text(
                "Add New Card",
                style: TextStyle(
                  color: AppColors.brandGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...List.generate(paymentMethods.length, (index) {
          final PaymentMethodModel method = paymentMethods[index];

          return PaymentMethodItem(
            title: method.title,
            iconPath: method.icon,
            isSelected: selectedMethodIndex == index,
            onTap: () => onMethodSelected(index),
            isSvg: method.isSvg,
          );
        }),
      ],
    );
  }
}

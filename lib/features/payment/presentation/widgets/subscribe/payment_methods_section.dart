import 'package:flutter/material.dart';
import '../../../../../core/theming/app_assets.dart';
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

  static final List<Map<String, dynamic>> paymentMethods = [
    {'title': 'Paypal', 'icon': AppAssets.appleIcon, 'isSvg': true},
    {'title': 'Google Pay', 'icon': AppAssets.googleIcon, 'isSvg': true},
    {'title': 'Apple Pay', 'icon': AppAssets.appleIcon, 'isSvg': true},
  ];

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
          return PaymentMethodItem(
            title: paymentMethods[index]['title'],
            iconPath: paymentMethods[index]['icon'],
            isSelected: selectedMethodIndex == index,
            onTap: () => onMethodSelected(index),
            isSvg: paymentMethods[index]['isSvg'],
          );
        }),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/payment_method_model.dart';
import '../payment_method_item.dart';

class PaymentMethodsSection extends StatelessWidget {
  final int selectedMethodIndex;
  final Function(int) onMethodSelected;

  const PaymentMethodsSection({
    super.key,
    required this.selectedMethodIndex,
    required this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Payment Methods", style: AppStyles.extraBold16),
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

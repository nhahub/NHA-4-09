import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SessionPrice extends StatelessWidget {
  const SessionPrice({
    super.key,
    required this.price,
    required this.priceAfterDiscount,
  });

  final num price;
  final num priceAfterDiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Price:", style: AppStyles.extraBold16),
        const SizedBox(height: 8),
        Row(
          children: [
            if (price != priceAfterDiscount)
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: AppStyles.bold14.copyWith(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            const SizedBox(width: 8),
            Text(
              "\$${priceAfterDiscount.toStringAsFixed(2)}",
              style: AppStyles.extraBold17.copyWith(color: AppColors.green),
            ),
          ],
        ),
      ],
    );
  }
}

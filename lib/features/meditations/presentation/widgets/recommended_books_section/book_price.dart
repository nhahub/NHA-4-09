import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class BookPrice extends StatelessWidget {
  final String? price;
  final String? currency;
  const BookPrice({super.key, required this.price, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.brandGreen,
        borderRadius: BorderRadius.circular(55),
      ),
      child: Text(
        "$price $currency",
        style: AppStyles.extraBold15.copyWith(color: Colors.white),
      ),
    );
  }
}

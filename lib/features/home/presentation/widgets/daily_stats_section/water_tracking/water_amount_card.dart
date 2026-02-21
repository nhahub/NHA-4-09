import 'package:flutter/material.dart';
import '../shared/app_custom_card.dart';
import 'water_amount_header.dart';
import 'water_cups_list.dart';

class WaterAmountCard extends StatelessWidget {
  final bool isWithArrow;
  const WaterAmountCard({super.key, required this.isWithArrow});

  @override
  Widget build(BuildContext context) {
    return AppCustomCard(
      child: Column(
        children: [
          WaterAmountHeader(isWithArrow: isWithArrow),
          const SizedBox(height: 10),
          const WaterCupsList(),
        ],
      ),
    );
  }
}

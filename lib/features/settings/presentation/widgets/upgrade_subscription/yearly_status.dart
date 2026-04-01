import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class YearlyStatus extends StatelessWidget {
  const YearlyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "You are currently subscribed to the Yearly Plan",
              style: AppStyles.medium15.copyWith(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

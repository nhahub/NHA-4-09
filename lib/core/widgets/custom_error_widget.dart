import 'package:flutter/material.dart';
import '../constants/constants.dart';

import '../theming/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Text(
                message,
                style: AppStyles.semiBold16,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.brandGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 24),
            Text(
              "Payment Successful",
              textAlign: TextAlign.center,
              style: AppStyles.extraBold27,
            ),
            const SizedBox(height: 16),
            const Text(
              "The ticket will be sent to your WhatsApp or personal email",
              textAlign: TextAlign.center,
              style: AppStyles.medium14,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () => Navigator.pop(context),
                buttonText: "View Ticket",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

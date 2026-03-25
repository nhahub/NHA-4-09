import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../home/presentation/widgets/sessions_for_you_section/contact_widget.dart';
import '../../../data/models/therapist_model.dart';

class TherapistContactSection extends StatelessWidget {
  final TherapistModel therapistModel;
  const TherapistContactSection({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sessions Prices", style: AppStyles.extraBold20),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ContactWidget(
              icon: AppAssets.chatIcon,
              price: therapistModel.chatPrice,
              discount: therapistModel.discount,
              priceAfterDiscount: therapistModel.chatPriceAfterDiscount,
              iconSize: 20,
            ),
            ContactWidget(
              icon: AppAssets.phoneIcon,
              price: therapistModel.livePrice,
              discount: therapistModel.discount,
              priceAfterDiscount: therapistModel.livePriceAfterDiscount,
              iconSize: 17,
              additionalWidth: 12,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: AppTextButton(
            onPressed: () {
              context.push(
                Routes.bookingSessionView,
                args: {'therapist': therapistModel},
              );
            },
            buttonText: "Book a session",
          ),
        ),
      ],
    );
  }
}

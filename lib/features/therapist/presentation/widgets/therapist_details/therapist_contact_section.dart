import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/therapist_model.dart';
import '../sessions_for_you_section/contact_widget.dart';
import 'contact_button.dart';

class TherapistContactSection extends StatelessWidget {
  final TherapistModel therapistModel;
  const TherapistContactSection({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Contact me", style: AppStyles.extraBold20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContactWidget(
              icon: AppAssets.chatIcon,
              price: therapistModel.chatPrice,
              discount: therapistModel.discount,
              priceAfterDiscount: therapistModel.chatPriceAfterDiscount,
              iconSize: 20,
            ),
            ContactButton(
              icon: Icons.email,
              onPressed: () {
                context.push(Routes.therapistChatView, args: therapistModel.id);
              },
              color: AppColors.orange,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContactWidget(
              icon: AppAssets.phoneIcon,
              price: therapistModel.livePrice,
              discount: therapistModel.discount,
              priceAfterDiscount: therapistModel.livePriceAfterDiscount,
              iconSize: 17,
              additionalWidth: 12,
            ),
            ContactButton(
              icon: Icons.call,
              onPressed: () {
                context.push(Routes.liveView);
              },
              color: AppColors.lightGreen,
            ),
          ],
        ),
      ],
    );
  }
}

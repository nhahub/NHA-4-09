import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../therapist/data/models/therapist_model.dart';
import 'contact_widget.dart';

class TherapistDetails extends StatelessWidget {
  const TherapistDetails({super.key, required this.therapistModel});
  final TherapistModel therapistModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(therapistModel.name, style: AppStyles.extraBold15),
          const SizedBox(height: 2),
          SizedBox(
            height: 3 * 20,
            child: Text(
              therapistModel.speciality,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium15.copyWith(
                color: AppColors.bodyGray,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ContactWidget(
            icon: AppAssets.chatIcon,
            price: therapistModel.chatPrice,
            discount: therapistModel.discount,
            priceAfterDiscount: therapistModel.chatPriceAfterDiscount,
            iconSize: 20,
          ),
          const SizedBox(height: 8),
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
    );
  }
}

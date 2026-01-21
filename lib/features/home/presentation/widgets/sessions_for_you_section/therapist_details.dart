import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/data/models/sessions_for_you_model.dart';
import 'package:moodly/features/home/presentation/widgets/sessions_for_you_section/contact_widget.dart';

class TherapistDetails extends StatelessWidget {
  const TherapistDetails({super.key, required this.sessionsForYouModel});
  final SessionsForYouModel sessionsForYouModel;

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
          Text(sessionsForYouModel.name, style: AppStyles.extraBold15),
          const SizedBox(height: 2),
          SizedBox(
            height: 3 * 20,
            child: Text(
              sessionsForYouModel.speciality,
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
            price: sessionsForYouModel.chatPrice,
            discount: sessionsForYouModel.discount,
            priceAfterDiscount: sessionsForYouModel.chatPriceAfterDiscount,
            iconSize: 20,
          ),
          const SizedBox(height: 8),
          ContactWidget(
            icon: AppAssets.phoneIcon,
            price: sessionsForYouModel.livePrice,
            discount: sessionsForYouModel.discount,
            priceAfterDiscount: sessionsForYouModel.livePriceAfterDiscount,
            iconSize: 17,
            additionalWidth: 12,
          ),
        ],
      ),
    );
  }
}

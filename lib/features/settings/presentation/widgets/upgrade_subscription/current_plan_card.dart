import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/string_extensions.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/payment/data/models/payment_types_model.dart';
import 'package:moodly/features/payment/data/models/subscription_model.dart';

import '../../../../../core/theming/app_colors.dart';

class CurrentPlanCard extends StatelessWidget {
  final SubscriptionModel? subscriptionModel;
  final List<PaymentTypesModel> types;
  final bool isNormal;
  const CurrentPlanCard({
    super.key,
    required this.subscriptionModel,
    required this.types,
    required this.isNormal,
  });
  PaymentTypesModel getCurrentType() {
    return types.firstWhere((e) => e.type == subscriptionModel?.type);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen.withAlpha(alphaFromPercentage(10)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.workspace_premium,
            size: 40,
            color: AppColors.brandGreen,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Plan",
                style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
              ),
              const SizedBox(height: 4),
              Text(
                isNormal
                    ? "Free Plan"
                    : "${subscriptionModel?.type.capitalize() ?? ''} Plan",
                style: AppStyles.extraBold17,
              ),
              const SizedBox(height: 4),
              if (!isNormal)
                Text(
                  "\$${PaymentTypesModel.getFinalPrice(getCurrentType())} / ${getCurrentType().duration}",
                ),
            ],
          ),
        ],
      ),
    );
  }
}

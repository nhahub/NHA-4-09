import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../data/models/payment_types_model.dart';

class ChoosePaymentType extends StatefulWidget {
  const ChoosePaymentType({super.key});

  @override
  State<ChoosePaymentType> createState() => _ChoosePaymentTypeState();
}

class _ChoosePaymentTypeState extends State<ChoosePaymentType> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.borderButton.withAlpha(alphaFromPercentage(12)),
        boxShadow: [
          const BoxShadow(color: AppColors.lightGreen, offset: Offset(0, -2)),
          BoxShadow(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(14)),
          ),
          const BoxShadow(
            color: AppColors.brandGreen,
            spreadRadius: -10.0,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          ...paymentTypes.asMap().entries.map((entry) {
            final index = entry.key;
            final type = entry.value;
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? Colors.white : Colors.transparent,
                ),
                child: Row(
                  children: [
                    isSelected
                        ? Image.asset(AppAssets.circleCheckBox, width: 22)
                        : Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withAlpha(
                                  alphaFromPercentage(50),
                                ),
                                width: 2,
                              ),
                            ),
                          ),
                    const SizedBox(width: 12),

                    Text(
                      "${type.price} RON",
                      style: AppStyles.extraBold16.copyWith(
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "/ ${type.duration}",
                      style: AppStyles.extraBold16.copyWith(
                        color: isSelected
                            ? AppColors.bodyGray
                            : Colors.white.withAlpha(alphaFromPercentage(80)),
                      ),
                    ),
                    const Spacer(),
                    if (type.discount != null)
                      AppTextButton(
                        backgroundColor: isSelected
                            ? null
                            : AppColors.buttonBlack.withAlpha(
                                alphaFromPercentage(50),
                              ),
                        withGradient: isSelected ? true : false,
                        onPressed: () {},
                        withShadow: false,
                        verticalPadding: 4,
                        horizontalPadding: 12,
                        borderRadius: 8,
                        child: Text(
                          type.discount ?? "",
                          style: AppStyles.medium14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

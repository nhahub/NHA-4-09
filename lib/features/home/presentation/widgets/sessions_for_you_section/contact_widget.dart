import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ContactWidget extends StatelessWidget {
  final String icon;
  final num price;
  final num priceAfterDiscount;
  final num discount;
  final double additionalWidth;
  final double iconSize;
  final bool isPaidUser = true;

  const ContactWidget({
    super.key,
    required this.icon,
    required this.price,
    required this.iconSize,
    this.additionalWidth = 8,
    required this.priceAfterDiscount,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: const ColorFilter.mode(
            AppColors.brandGreen,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: additionalWidth),
        if (isPaidUser && discount != 0) ...[
          Text(
            "$price",
            style: AppStyles.medium15.copyWith(
              color: AppColors.bodyGray,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            "$priceAfterDiscount USD",
            style: AppStyles.extraBold15.copyWith(color: AppColors.linkGray),
          ),
        ],
        if (isPaidUser == false || isPaidUser && discount == 0)
          Text(
            "$price USD",
            style: AppStyles.extraBold15.copyWith(color: AppColors.linkGray),
          ),
        const SizedBox(width: 3),
        Text(
          "/ hour",
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}

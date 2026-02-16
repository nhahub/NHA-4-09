import 'package:flutter/material.dart';

import '../../../../../core/extensions/svg_shadow_extension.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/premium_offer_model.dart';

class PremiumOffers extends StatelessWidget {
  const PremiumOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: premiumOffers
          .map(
            (offer) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  offer.icon.svgWithShadow(size: 24, color: Colors.white),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer.title,
                          style: AppStyles.extraBold15WithShadow.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          offer.subtitle,
                          softWrap: true,
                          style: AppStyles.medium15WithShadow.copyWith(
                            color: Colors.white.withAlpha(
                              alphaFromPercentage(80),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

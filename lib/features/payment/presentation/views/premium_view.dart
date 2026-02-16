import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/premium_offers/continue_with_free_tier_button.dart';
import '../widgets/premium_offers/free_tier.dart';
import '../widgets/premium_offers/premium_background.dart';
import '../widgets/premium_offers/premium_header.dart';
import '../widgets/premium_offers/premium_offers.dart';
import '../widgets/premium_offers/subscribe_section.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({super.key, required this.withClose});
  final bool withClose;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PremiumBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kAppHorizontalPadding,
            ),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                PremiumHeader(withClose: withClose),
                const Spacer(),
                const PremiumOffers(),
                const SubscribeSection(),
                const ContinueWithFreeTierButton(),
                const FreeTier(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

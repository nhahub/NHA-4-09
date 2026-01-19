import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodly/core/constants/static.dart';

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                PremiumHeader(withClose: withClose),
                const Spacer(),
                const PremiumOffers(),
                const SizedBox(height: 20),
                const SubscribeSection(),
                const SizedBox(height: 20),
                const ContinueWithFreeTierButton(),
                const SizedBox(height: 20),
                const FreeTier(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

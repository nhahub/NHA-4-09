import 'package:flutter/material.dart';

import '../../../../../core/extensions/svg_shadow_extension.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';

class PremiumAppName extends StatelessWidget {
  const PremiumAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Moodly', style: AppStyles.extraBold50WithShadow),
        Row(
          children: [
            Text(
              'Premium',
              style: AppStyles.extraBold27WithShadow.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            AppAssets.premiumIcon.svgWithShadow(size: 22, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

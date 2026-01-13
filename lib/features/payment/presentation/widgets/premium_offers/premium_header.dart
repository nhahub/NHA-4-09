import 'package:flutter/material.dart';

import '../../../../../core/extensions/svg_shadow_extension.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/widgets/custom_close_widget.dart';
import 'premium_app_name.dart';

class PremiumHeader extends StatelessWidget {
  final bool withClose;
  const PremiumHeader({super.key, required this.withClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppAssets.zenspunLogo.svgWithShadow(size: 55, color: Colors.white),
        const SizedBox(width: 18),
        const PremiumAppName(),
        const Spacer(),
        if (withClose)
        const CustomCloseWidget(),
      ],
    );
  }
}

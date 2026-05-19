import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_circle_button.dart';

class PersonaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PersonaAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Your Persona',
        style: AppStyles.extraBold20.copyWith(color: Colors.white),
      ),
      leading: Center(
        child: CustomCircleButton(
          icon: AppAssets.arrowLeftIosIcon,
          onTap: () => context.pop(),
          padding: 8,
          backgroundcolor: Colors.white.withValues(alpha: .1),
        ),
      ),
    );
  }
}

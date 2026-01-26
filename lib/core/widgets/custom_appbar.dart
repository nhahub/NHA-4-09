import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../enums/fade_position.dart';
import '../theming/app_styles.dart';
import 'custom_circle_button.dart';
import 'fade_scrollable.dart';
import 'free_container.dart';
import 'premium_container.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? icon;
  final VoidCallback? onTap;
  final bool isPremium;
  const CustomAppbar({
    super.key,
    required this.isPremium,
    this.onTap,
    required this.title,
    this.icon,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: preferredSize.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const FadeScrollable(
              fadePosition: FadePosition.top,
              child: SizedBox.expand(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Row(
                children: [
                  Text(title, style: AppStyles.extraBold27),
                  const SizedBox(width: 20),
                  isPremium ? const PremiumContainer() : const FreeContainer(),
                  const Spacer(),
                  icon != null
                      ? CustomCircleButton(icon: icon!, onTap: onTap)
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

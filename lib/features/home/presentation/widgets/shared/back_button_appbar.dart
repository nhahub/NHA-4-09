import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/enums/fade_position.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';
import '../../../../../core/widgets/fade_scrollable.dart';

class BackButtonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? endIcon;
  final VoidCallback? onEndTap;

  static const double height = 80;

  const BackButtonAppbar({super.key, this.title, this.endIcon, this.onEndTap});

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const FadeScrollable(
              fadePosition: FadePosition.top,
              child: SizedBox.expand(),
            ),

            /// 🔹 Title في النص الحقيقي
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  title ?? "",
                  style: AppStyles.extraBold20,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            /// 🔹 Back button (left)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  context.canPop
                      ? CustomCircleButton(
                          icon: AppAssets.arrowLeftIosIcon,
                          onTap: () => context.pop(),
                        )
                      : const SizedBox(),

                  /// 🔹 End icon (right)
                  endIcon != null
                      ? GestureDetector(
                          onTap: onEndTap ?? () {},
                          child: Icon(endIcon!, size: 20, color: Colors.black),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

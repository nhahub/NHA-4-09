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
  static const double height = 80;
  const BackButtonAppbar({super.key, this.title});

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: Row(
                children: [
                  context.canPop
                      ? CustomCircleButton(
                          icon: AppAssets.arrowLeftIosIcon,
                          onTap: () {
                            context.pop();
                          },
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: context.canPop ? 15 : kAppHorizontalPadding),
                  Text(title ?? "", style: AppStyles.extraBold21),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

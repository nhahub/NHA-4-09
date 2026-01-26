import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/enums/fade_position.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/custom_circle_button.dart';
import 'package:moodly/core/widgets/fade_scrollable.dart';

class BackButtonAppbar extends StatelessWidget {
  final String title;
  const BackButtonAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 80,
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
                  CustomCircleButton(
                    icon: AppAssets.arrowLeftIosIcon,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  const SizedBox(width: 15),
                  Text(title, style: AppStyles.extraBold27),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';

class SwipeWidget extends StatelessWidget {
  const SwipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Column(
        children: [
          const Text("Swipe Up to Read More", style: AppStyles.medium15),
          Transform.rotate(
            angle: -3.14 / 2,
            child: SvgPicture.asset(
              AppAssets.arrowLeftIosIcon,
              width: 16,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

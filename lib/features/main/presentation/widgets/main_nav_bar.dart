import 'package:flutter/material.dart';

import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import 'nav_widget.dart';

class MainNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const MainNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      AppAssets.homeIcon,
      AppAssets.usersIcon,
      AppAssets.playCircleIcon,
      AppAssets.chatIcon,
      AppAssets.userCircleIcon,
    ];

    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 30, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(333),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 66.79),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(2)),
            blurRadius: 26.72,
          ),
          BoxShadow(
            offset: const Offset(0, 37.74),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(7)),
            blurRadius: 22.71,
          ),
          BoxShadow(
            offset: const Offset(0, 16.7),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 16.7,
          ),
          BoxShadow(
            offset: const Offset(0, 4.34),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(14)),
            blurRadius: 9.35,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double itemWidth = constraints.maxWidth / icons.length;

          return Stack(
            children: [
              AnimatedPositioned(
                left: selectedIndex * itemWidth + (itemWidth - 60) / 2,
                top: 5,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: 60,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),

              Row(
                children: List.generate(
                  icons.length,
                  (index) => GestureDetector(
                    onTap: () => onTap(index),
                    child: SizedBox(
                      width: itemWidth,
                      height: 56,
                      child: Center(
                        child: NavWidget(
                          index: index,
                          icons: icons,
                          selectedIndex: selectedIndex,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

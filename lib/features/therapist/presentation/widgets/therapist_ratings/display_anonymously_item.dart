import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodly/core/theming/app_styles.dart';

class DisplayAnonymouslyItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const DisplayAnonymouslyItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xfffafbed),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xfffec345)
                : const Color(0xfffafbed),
          ),
        ),
        child: Row(
          spacing: 12,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xfffec345),
                BlendMode.srcIn,
              ),
            ),
            Text(title, style: AppStyles.medium16),
          ],
        ),
      ),
    );
  }
}

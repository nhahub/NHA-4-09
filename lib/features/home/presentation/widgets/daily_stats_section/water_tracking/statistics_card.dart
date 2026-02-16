import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_styles.dart';

class StatisticsCard extends StatelessWidget {
  final Color bgColor;
  final String icon;
  final Color bgIconColor;
  final String title;
  final String progress;

  const StatisticsCard({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.bgIconColor,
    required this.progress,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: bgColor,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: bgIconColor,
          child: SvgPicture.asset(
            icon,
            height: 20,
            width: 20,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        title: Text(title, style: AppStyles.medium15),
        subtitle: Text(
          progress,
          style: AppStyles.regular14.copyWith(color: bgIconColor),
        ),
      ),
    );
  }
}

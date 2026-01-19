import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';

import '../theming/app_styles.dart';

class AppSectionHeader extends StatelessWidget {
  final String title;
  const AppSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kAppHorizontalPadding),
      child: Text(title, style: AppStyles.extraBold20),
    );
  }
}

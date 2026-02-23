import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';

class CustomDetailsHeader extends StatelessWidget {
  final String title;
  const CustomDetailsHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(title, style: AppStyles.extraBold20),
    );
  }
}

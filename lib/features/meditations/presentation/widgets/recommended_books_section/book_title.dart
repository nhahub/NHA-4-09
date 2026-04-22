import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class BookTitle extends StatelessWidget {
  final String title;
  const BookTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.extraBold17,
      textAlign: TextAlign.center,
    );
  }
}

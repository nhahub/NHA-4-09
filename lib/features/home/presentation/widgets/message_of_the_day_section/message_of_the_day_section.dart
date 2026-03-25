import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'quote_bloc_builder.dart';

class MessageOfTheDaySection extends StatelessWidget {
  static const double cardRadius = 20.0;
  static const double rotationAngle = 3 * pi / 180;
  static const Offset translateOffset = Offset(0, -10);

  const MessageOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 35,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Message of the Day"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
          child: QuoteBlocBuilder(),
        ),
      ],
    );
  }
}

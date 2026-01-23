import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/spacing.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'card_contant.dart';
import 'card_dot.dart';

class MessageOfTheDaySection extends StatelessWidget {
  final String quote =
      "Don't waste time knocking on the wall, hoping to turn it into a door.";
  final String author = "Coco Chanel";
  const MessageOfTheDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Message of the Day"),
        gapHeight(35),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Stack(
            children: [
              Transform.rotate(
                angle: 3 * pi / 180,
                child: Transform.translate(
                  offset: const Offset(0, -10),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.brandGreen, width: 2),
                      gradient: const LinearGradient(
                        colors: [AppColors.lightGreen, AppColors.brandGreen],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.75],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.brandGreen, width: 2),
                  gradient: const LinearGradient(
                    colors: [AppColors.lightGreen, AppColors.brandGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: -30,
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                          AppAssets.cardEffect,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [CardDot(), CardDot()],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: CardContant(quote: quote, author: author),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [CardDot(), CardDot()],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

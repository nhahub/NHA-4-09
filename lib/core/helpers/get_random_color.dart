import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';

Color getRandomColor({required int index}) {
  final colors = [
    const Color(0xff2b7fff),
    const Color(0xffad46ff),
    const Color(0xff00c950),
    AppColors.red,
  ];

  return colors[index % colors.length];
}

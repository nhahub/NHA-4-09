import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';

Color getRandomContainerColor({required int index}) {
  final colors = [
    const Color(0xffddeff9),
    const Color(0xfffceee1),
    const Color(0xfff5eafa),
    const Color(0xffF5DBDC),
  ];

  return colors[index % colors.length];
}

Color getRandomTextColor({required int index}) {
  final colors = [
    const Color(0xff37b4f4),
    const Color(0xffe58522),
    const Color(0xffc990ef),
    AppColors.red,
  ];

  return colors[index % colors.length];
}

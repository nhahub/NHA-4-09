import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color lightGreen = Color(0xff59CF77);
  static const Color brandGreen = Color(0xff32B453);
  static const Color green = Color(0xff4CAF50);
  static const Color bodyGray = Color(0xff8A8E99);
  static const Color linkGray = Color(0xff707480);
  static const Color bgFill = Color(0xffF9F9FB);
  static const Color borderButton = Color(0xff07112E);
  static const Color lightGrey = Color(0xffBDBDBD);
  static const Color shadow = Color(0xff0B1324);
  static const Color buttonBlack = Color(0xff191C24);
  static const Color darkRed = Color(0xffdb2323);
  static const Color yellow = Color(0xffffEB3B);
  static const Color red = Color(0xffEA7173);
  static const Color orange = Color(0xfff6b554);

  static final List<Color> profileAvatarColors = [
    const Color(0xff1cb0f6),
    const Color(0xff58a700),
    const Color(0xffff4b4c),
    const Color(0xffff9600),
    const Color(0xffce82ff),
  ];
  static Color getRandomColor() {
    final Random random = Random();
    return profileAvatarColors[random.nextInt(profileAvatarColors.length)];
  }
}

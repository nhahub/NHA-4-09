import 'package:flutter/material.dart';

import '../helpers/alpha_from_percent.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

abstract class AppStyles {
  static const TextStyle extraBold27 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -1,
  );
  static const TextStyle extraBold21 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle extraBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle bold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.bold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
    static const TextStyle extraBold17 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
    static const TextStyle semiBold17 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle extraBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle semiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle extraBold15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle medium15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SFPro",
  );
  static const TextStyle extraBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static const TextStyle medium14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SFPro",
  );
  static const TextStyle regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    fontFamily: "SFPro",
  );
  static const TextStyle extraBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
  );
  static TextStyle extraBold50WithShadow = TextStyle(
    fontSize: 50,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    color: Colors.white,
    letterSpacing: -1,
    height: 0.95,
    shadows: [
      Shadow(
        color: Colors.black.withAlpha(alphaFromPercentage(25)),
        offset: const Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  );

  static TextStyle extraBold27WithShadow = TextStyle(
    fontSize: 27,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -1,
    height: 1.5,
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.black.withAlpha(alphaFromPercentage(25)),
        offset: const Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  );
  static TextStyle extraBold20WithShadow = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
    shadows: [
      Shadow(
        color: Colors.black.withAlpha(alphaFromPercentage(24)),
        offset: const Offset(0, 2),
        blurRadius: 2,
      ),
    ],
  );
  static TextStyle extraBold15WithShadow = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.extraBold,
    fontFamily: "Nunito",
    letterSpacing: -0.2,
    shadows: [
      Shadow(
        color: Colors.black.withAlpha(alphaFromPercentage(25)),
        offset: const Offset(0, 1.34),
        blurRadius: 4,
      ),
    ],
  );
  static TextStyle medium15WithShadow = TextStyle(
    fontSize: 15,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SFPro",
    shadows: [
      Shadow(
        color: Colors.black.withAlpha(alphaFromPercentage(25)),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ],
  );
  static TextStyle medium14WithShadow = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SFPro",
    shadows: [
      Shadow(
        color: AppColors.shadow.withAlpha(alphaFromPercentage(70)),
        offset: const Offset(0, 1.34),
        blurRadius: 4,
      ),
    ],
  );
}

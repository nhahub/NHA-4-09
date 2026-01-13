import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import '../helpers/alpha_from_percent.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.child,
    this.shadowColor,
    this.withGradient = true,
    this.backgroundColor,
    this.active = true,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
    this.withShadow,
  });
  final String? buttonText;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? shadowColor;
  final bool? withGradient;
  final bool? withShadow;
  final bool active;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        boxShadow: withShadow == true
            ? [
                BoxShadow(
                  color: active
                      ? AppColors.brandGreen
                      : shadowColor ?? AppColors.lightGrey,
                  blurRadius: 0,
                  offset: const Offset(0, 0),
                  spreadRadius: 2,
                  blurStyle: BlurStyle.normal,
                ),
                BoxShadow(
                  color:
                      shadowColor ??
                      AppColors.shadow.withAlpha(alphaFromPercentage(50)),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                ),
              ]
            : null,
      ),
      child: InnerShadow(
        shadows: [
          Shadow(
            color: Colors.white.withAlpha(alphaFromPercentage(12)),
            offset: const Offset(0, 2),
            blurRadius: 3,
          ),
        ],
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              gradient: withGradient == true
                  ? LinearGradient(
                      colors: [
                        active ? AppColors.lightGreen : AppColors.lightGrey,
                        active ? AppColors.brandGreen : AppColors.lightGrey,
                      ],
                      stops: [0.0, active ? 0.75 : 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 14,
                  horizontal: horizontalPadding ?? 24,
                ),
                child:
                    child ??
                    Text(
                      buttonText ?? 'Continue',
                      style: AppStyles.pPlayful.copyWith(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: const Color(
                              0xff0B1324,
                            ).withAlpha((255 * 0.24).toInt()),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import '../theming/app_assets.dart';
import '../theming/app_styles.dart';
import '../widgets/app_text_button.dart';

Future<dynamic> confirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.brandGreen.withAlpha(alphaFromPercentage(4)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.brandGreen.withAlpha(
                      alphaFromPercentage(8),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppColors.brandGreen, AppColors.lightGreen],
                      ),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.checkMark,
                      width: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(title, style: AppStyles.bold20),
              const SizedBox(height: 5),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppStyles.regular14,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: AppTextButton(
                  onPressed: onConfirm,
                  buttonText: "Continue",
                  borderRadius: 30,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

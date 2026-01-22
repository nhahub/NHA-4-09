import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/static.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class QuestionnaireButton extends StatelessWidget {
  const QuestionnaireButton({
    super.key,
    required this.currentPageIndex,
    required this.onNext,
    required this.onFinish,
    required this.questionsLength,
    required this.selectedValues,
  });

  final VoidCallback onNext;
  final VoidCallback onFinish;
  final int currentPageIndex;
  final int questionsLength;
  final List<String> selectedValues;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: AppTextButton(
          onPressed: () {
            if (currentPageIndex == questionsLength) {
              return onFinish();
            } else if (selectedValues.isEmpty) {
              null;
            } else {
              onNext();
            }
          },
          active: selectedValues.isNotEmpty,
          child: currentPageIndex == questionsLength
              ? Center(
                  child: Text(
                    "Finish",
                    style: AppStyles.extraBold16.copyWith(color: Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue",
                      style: AppStyles.extraBold16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppAssets.arrowRightIcon,
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

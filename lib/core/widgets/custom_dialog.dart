import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extensions/context_extensions.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class CustomDialog<C extends StateStreamable<S>, S> extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.buttonText,
    required this.bodyContent,
    required this.title,
    required this.buttonColor,
    required this.onPressed,
    this.cancelButtonText,
  });
  final String buttonText;
  final String bodyContent;
  final String title;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String? cancelButtonText;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          top: 12,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppStyles.bold20),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close_rounded, size: 26),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(bodyContent, style: AppStyles.semiBold17),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffeaeaec),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      cancelButtonText ?? "Cancel",
                      style: AppStyles.semiBold16.copyWith(
                        color: AppColors.bodyGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: AppStyles.semiBold16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

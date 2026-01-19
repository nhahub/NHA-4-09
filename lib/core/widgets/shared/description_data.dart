import 'package:flutter/material.dart';
import '../../helpers/alpha_from_percent.dart';
import '../../theming/app_styles.dart' show AppStyles;

class DescriptionData extends StatelessWidget {
  const DescriptionData({
    super.key,
    required this.title,
    this.duration,
    this.withDuration,
    this.titleStyle,
  });

  final String title;
  final int? duration;
  final bool? withDuration;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style:
                titleStyle ??
                AppStyles.extraBold15WithShadow.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 5),
          withDuration == true
              ? Text(
                  "$duration minutes",
                  style: AppStyles.medium14WithShadow.copyWith(
                    color: Colors.white.withAlpha(alphaFromPercentage(80)),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

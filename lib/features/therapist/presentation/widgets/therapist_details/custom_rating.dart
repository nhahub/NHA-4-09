import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/app_assets.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.isEditable,
    this.userRating,
    this.onRatingUpdate,
    this.itemSize = 14,
  });
  final bool isEditable;
  final double? userRating;
  final double itemSize;
  final void Function(double)? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEditable,
      child: RatingBar.builder(
        initialRating: userRating?.toDouble() ?? 0.0,
        updateOnDrag: isEditable,
        glow: false,
        minRating: 1,
        unratedColor: const Color(0xffffecb0),
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,
        itemSize: itemSize,
        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
        itemBuilder: (context, _) {
          return SvgPicture.asset(AppAssets.starIcon);
        },
        onRatingUpdate: (value) {
          if (isEditable) {
            if (onRatingUpdate != null) {
              onRatingUpdate!(value);
            }
          }
        },
      ),
    );
  }
}

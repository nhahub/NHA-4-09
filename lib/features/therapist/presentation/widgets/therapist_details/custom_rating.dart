import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../manager/rating_cubit/rating_cubit.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.isEditable,
    required this.userRating,
  });
  final bool isEditable;
  final double? userRating;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEditable,
      child: RatingBar.builder(
        initialRating: userRating ?? 0,
        updateOnDrag: isEditable,
        glow: false,
        minRating: 1,
        unratedColor: const Color(0xffffecb0),
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 14,
        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0),
        itemBuilder: (context, _) {
          return SvgPicture.asset(AppAssets.starIcon);
        },
        onRatingUpdate: (value) {
          if (isEditable) {
            context.read<RatingCubit>().setUserRating(userRating: value);
          }
        },
      ),
    );
  }
}

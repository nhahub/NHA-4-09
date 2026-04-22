import 'package:flutter/material.dart';
import 'star_rating.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class BookRating extends StatelessWidget {
  final String rating;
  const BookRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final value = (rating == "null" || rating.isEmpty) ? "0.0" : rating;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StarRating(rating: double.parse(value), size: 25),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: AppStyles.semiBold16.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: " / 5.0",
                style: AppStyles.semiBold16.copyWith(color: AppColors.bodyGray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class StarRating extends StatelessWidget {
  final double rating ;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 20,
  });

  Widget buildStar(int index) {
    if (rating >= index) {
      return Icon(Icons.star_rounded,
          color: AppColors.orange, size: size);
    } else if (rating >= index - 0.5) {
      return Icon(Icons.star_half_rounded,
          color: AppColors.orange, size: size);
    } else {
      return Icon(Icons.star_rounded,
          color: Colors.grey.shade300, size: size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) => buildStar(index + 1)),
    );
  }
}
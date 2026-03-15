import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ReviewWidget extends StatefulWidget {
  final String review;

  const ReviewWidget({super.key, required this.review});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            widget.review,
            maxLines: isExpanded ? null : 2,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: AppStyles.regular14,
          ),
        ),
        const SizedBox(height: 4),

        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "See less" : "See more",
            style: AppStyles.extraBold15.copyWith(
              color: isExpanded ? AppColors.orange : AppColors.lightGreen,
            ),
          ),
        ),
      ],
    );
  }
}

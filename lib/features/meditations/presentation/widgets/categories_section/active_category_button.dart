import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/features/meditations/data/models/category_enum.dart';

class ActiveCategoryButton extends StatelessWidget {
  const ActiveCategoryButton({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      onPressed: () {},
      horizontalPadding: 16,
      child: Center(
        child: Text(
          category.title,
          style: AppStyles.extraBold14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}


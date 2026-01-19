import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/models/category_enum.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/active_category_button.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: Category.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ActiveCategoryButton(category: Category.values[index]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/data/models/category_enum.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/active_category_button.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/un_active_category_button.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  Category selectedCategory = Category.values.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        itemCount: Category.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 5.34),
        itemBuilder: (context, index) {
          final category = Category.values[index];
          final isActive = selectedCategory == category;

          return isActive
              ? ActiveCategoryButton(
                  category: category,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                )
              : UnActiveCategoryButton(
                  category: category,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
        },
      ),
    );
  }
}

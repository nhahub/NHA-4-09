import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/active_category_button.dart';
import 'package:moodly/features/meditations/presentation/widgets/categories_section/un_active_category_button.dart';

class CategoriesSection<T> extends StatefulWidget {
  final List<T> categories;
  final String Function(T) getTitle;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.getTitle,
  });

  @override
  State<CategoriesSection<T>> createState() => _CategoriesSectionState<T>();
}

class _CategoriesSectionState<T> extends State<CategoriesSection<T>> {
  late T selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 5.34),
        itemBuilder: (context, index) {
          final T category = widget.categories[index];
          final bool isActive = selectedCategory == category;
          final String title = widget.getTitle(category);

          return isActive
              ? ActiveCategoryButton(
                  title: title,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                )
              : UnActiveCategoryButton(
                  title: title,
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

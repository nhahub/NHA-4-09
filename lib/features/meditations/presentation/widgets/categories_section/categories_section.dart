import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'active_category_button.dart';
import 'un_active_category_button.dart';

class CategoriesSection<T> extends StatefulWidget {
  final List<T> categories;
  final String Function(T) getTitle;
  final void Function(T category) onCategorySelected;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.getTitle,
    required this.onCategorySelected,
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
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(widget.categories.length, (index) {
            final T category = widget.categories[index];
            final bool isActive = selectedCategory == category;
            final String title = widget.getTitle(category);

            Widget button = isActive
                ? ActiveCategoryButton(
                    title: title,
                    onTap: () => _onCategoryTap(category),
                  )
                : UnActiveCategoryButton(
                    title: title,
                    onTap: () => _onCategoryTap(category),
                  );

            if (index != 0 && index != widget.categories.length - 1) {
              return Row(children: [const SizedBox(width: 5.34), button]);
            }
            if (index == 0) {
              return Row(
                children: [
                  const SizedBox(width: kAppHorizontalPadding),
                  button,
                ],
              );
            }
            if (index == widget.categories.length - 1) {
              return Row(
                children: [
                  const SizedBox(width: 5.34),
                  button,
                  const SizedBox(width: kAppHorizontalPadding),
                ],
              );
            }

            return button;
          }),
        ),
      ),
    );
  }

  void _onCategoryTap(T category) {
    setState(() {
      selectedCategory = category;
    });
    widget.onCategorySelected(category);
  }
}

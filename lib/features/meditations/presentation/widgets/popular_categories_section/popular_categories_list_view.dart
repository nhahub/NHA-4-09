import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/features/meditations/data/mock_data/popular_categories_data.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/category_card.dart';

class PopularCategoriesListView extends StatelessWidget {
  const PopularCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 192.35,
      itemCount: popularCategoriesData.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          popularCategoriesModel: popularCategoriesData[index],
          onTap: () {},
        );
      },
    );
  }
}
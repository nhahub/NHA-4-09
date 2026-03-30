import 'package:flutter/material.dart';

import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/mock_data/popular_categories_data.dart';
import 'category_card.dart';

class PopularCategoriesListView extends StatelessWidget {
  final bool isLoading;

  const PopularCategoriesListView({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
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

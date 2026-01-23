import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/shared/card_description_container.dart';
import '../../../data/models/popular_categories_model.dart';

class CategoryCard extends StatelessWidget {
  final PopularCategoriesModel popularCategoriesModel;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.popularCategoriesModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:  165.64,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(popularCategoriesModel.imagePath),
            fit: BoxFit.cover,
          ),
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CardDescriptionContainer(
                title: popularCategoriesModel.title,
                withDuration: false,
                titleStyle: AppStyles.extraBold20.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/new_arrivals_data.dart';

class NewArrivalsGridView extends StatelessWidget {
  const NewArrivalsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 165.64 / 313.91,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return CustomCard(
            meditationCardModel: newArrivalsData[index],
            onTap: () {
              context.push(Routes.audioView);
            },
          );
        },
        itemCount: newArrivalsData.length,
      ),
    );
  }
}

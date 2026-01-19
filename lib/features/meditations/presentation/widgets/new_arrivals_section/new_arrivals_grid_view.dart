import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/data/mock_data/new_arrivals_data.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/custom_card.dart';

class NewArrivalsGridView extends StatelessWidget {
  const NewArrivalsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: GridView.builder(
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
            onTap: () {},
          );
        },
        itemCount: newArrivalsData.length,
      ),
    );
  }
}

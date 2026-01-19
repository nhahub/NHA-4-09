import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/features/meditations/data/mock_data/recommended_for_you_data.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/custom_card.dart';

class RecommendedForYouListView extends StatelessWidget {
  const RecommendedForYouListView({super.key});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: recommendedForYouData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: recommendedForYouData[index],
          onTap: () {},
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/features/meditations/data/mock_data/for_difficult_situations_data.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/custom_card.dart';

class ForDifficultSituationsListView extends StatelessWidget {
  const ForDifficultSituationsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: forDifficultSituationsData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: forDifficultSituationsData[index],
          onTap: () {},
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/core/widgets/shared/custom_card.dart';
import 'package:moodly/features/home/mock_data/meditations_for_you_data.dart';

class MeditationsForYouListView extends StatelessWidget {
  const MeditationsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: meditationsForYouData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: meditationsForYouData[index],
          onTap: () {},
        );
      },
    );
  }
}

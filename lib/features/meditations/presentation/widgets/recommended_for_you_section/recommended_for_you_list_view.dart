import 'package:flutter/material.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/mock_data/recommended_for_you_data.dart';
import '../../../../../core/widgets/shared/custom_card.dart';

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

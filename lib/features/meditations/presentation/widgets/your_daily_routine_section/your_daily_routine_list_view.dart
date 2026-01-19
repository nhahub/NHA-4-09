import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/features/meditations/data/mock_data/your_daily_routine_data.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/custom_card.dart';

class YourDailyRoutineListView extends StatelessWidget {
  const YourDailyRoutineListView({super.key});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: yourDailyRoutineData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: yourDailyRoutineData[index],
          onTap: () {},
        );
      },
    );
  }
}

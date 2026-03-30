import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/recommended_for_you_data.dart';

class RecommendedForYouListView extends StatelessWidget {
  final bool isLoading;

  const RecommendedForYouListView({super.key, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: recommendedForYouData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: recommendedForYouData[index],
          onTap: () {
            context.push(Routes.videoView);
          },
        );
      },
    );
  }
}

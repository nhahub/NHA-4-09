import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/horizontal_padding_list.dart';
import 'package:moodly/features/home/data/models/sessions_for_you_model.dart';
import 'package:moodly/features/home/presentation/widgets/sessions_for_you_section/sessions_for_you_card.dart';

class SessionsForYouListView extends StatelessWidget {
  const SessionsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 382,
      itemCount: sessionsForYouData.length,
      itemBuilder: (context, index) {
        return SessionsForYouCard(
          sessionsForYouModel: sessionsForYouData[index],
        );
      },
    );
  }
}

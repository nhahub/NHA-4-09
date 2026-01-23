import 'package:flutter/material.dart';

import '../../../data/models/sessions_for_you_model.dart';
import 'discount_container.dart';
import 'rating_container.dart';

class TherapistCoverInfo extends StatelessWidget {
  const TherapistCoverInfo({super.key, required this.sessionsForYouModel});

  final SessionsForYouModel sessionsForYouModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            sessionsForYouModel.image,
            fit: BoxFit.cover,
            height: 180.33,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: RatingContainer(sessionsForYouModel: sessionsForYouModel),
        ),
        if (sessionsForYouModel.discount != 0)
          Positioned(
            bottom: 16,
            right: 16,
            child: DiscountContainer(sessionsForYouModel: sessionsForYouModel),
          ),
      ],
    );
  }
}

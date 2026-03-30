import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../therapist/data/models/therapist_model.dart';
import 'discount_container.dart';
import 'rating_container.dart';

class TherapistCoverInfo extends StatelessWidget {
  const TherapistCoverInfo({super.key, required this.therapistModel});

  final TherapistModel therapistModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: therapistModel.image,
            fit: BoxFit.cover,
            height: 180.33,
            width: double.infinity,

            placeholder: (context, url) => Container(
              height: 180.33,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            errorWidget: (context, url, error) => Container(
              height: 180.33,
              width: double.infinity,
              color: Colors.grey,
              child: const Icon(Icons.broken_image),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: RatingContainer(therapistModel: therapistModel),
        ),
        if (therapistModel.discount != 0)
          Positioned(
            bottom: 16,
            right: 16,
            child: DiscountContainer(sessionsForYouModel: therapistModel),
          ),
      ],
    );
  }
}

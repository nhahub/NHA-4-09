import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/widgets/sessions_for_you_section/discount_container.dart';
import '../../../data/models/therapist_model.dart';

class TherapistImage extends StatelessWidget {
  final TherapistModel therapistModel;

  const TherapistImage({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: therapistModel.image,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,

            placeholder: (context, url) => Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            errorWidget: (context, url, error) => Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              child: const Icon(Icons.broken_image),
            ),
          ),
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

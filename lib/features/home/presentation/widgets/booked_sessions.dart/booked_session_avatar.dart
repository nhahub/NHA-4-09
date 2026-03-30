import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../therapist/data/models/booking_model.dart';


class BookedSessionAvatar extends StatelessWidget {
  const BookedSessionAvatar({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    final imageUrl = bookingModel.therapistImage.isNotEmpty
        ? bookingModel.therapistImage
        : kImagePlaceHolder;

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,

          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),

          errorWidget: (context, url, error) => Container(
            width: 60,
            height: 60,
            color: Colors.grey[300],
            child: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
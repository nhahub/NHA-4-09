import 'package:flutter/material.dart';
import '../../../data/models/therapist_rating_model.dart';
import 'rating_stars.dart';

class RatingCard extends StatelessWidget {
  final TherapistRatingModel rating;

  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// USER INFO
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(rating.userAvatar!),
                child: rating.userAvatar == null
                    ? Text(rating.userName.substring(0, 1))
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  rating.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "${rating.createdAt.day}/${rating.createdAt.month}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// STARS
          RatingStars(rating: rating.rating.toInt()),

          const SizedBox(height: 8),

          /// REVIEW
          Text(rating.review, style: const TextStyle(height: 1.4)),
        ],
      ),
    );
  }
}

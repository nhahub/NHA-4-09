import 'package:flutter/material.dart';
import '../../../data/models/therapist_rating_model.dart';
import 'rating_distribution.dart';

class RatingSummary extends StatelessWidget {
  final List<TherapistRatingModel> ratings;
  final double average;
  final int count;

  const RatingSummary({
    super.key,
    required this.ratings,
    required this.average,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              average.toStringAsFixed(1),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.star, color: Colors.amber),
            Text("$count reviews"),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: RatingDistribution(ratings: ratings),
        ),
      ],
    );
  }
}
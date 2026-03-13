import 'package:flutter/material.dart';
import '../../../data/models/therapist_rating_model.dart';

class RatingDistribution extends StatelessWidget {
  final List<TherapistRatingModel> ratings;

  const RatingDistribution({super.key, required this.ratings});

  int count(int star) {
    return ratings.where((e) => e.rating == star).length;
  }

  double percent(int star) {
    if (ratings.isEmpty) return 0;
    return count(star) / ratings.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        final star = 5 - index;

        return Row(
          children: [
            Text("$star"),
            const Icon(Icons.star, size: 16, color: Colors.amber),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: percent(star),
                minHeight: 8,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            Text(count(star).toString()),
          ],
        );
      }),
    );
  }
}

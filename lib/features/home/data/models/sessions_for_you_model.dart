import 'package:moodly/core/theming/app_assets.dart';

class SessionsForYouModel {
  final String image;
  final String name;
  final String speciality;
  final int discount;
  final int livePrice;
  final int chatPrice;
  final RatingModel rating;

  const SessionsForYouModel({
    required this.image,
    required this.name,
    required this.speciality,
    required this.discount,
    required this.livePrice,
    required this.chatPrice,
    required this.rating,
  });
}

class RatingModel {
  final double rating;
  final int ratingCount;

  const RatingModel({required this.rating, required this.ratingCount});
}

const List<SessionsForYouModel> sessionsForYouData = [
  SessionsForYouModel(
    image: AppAssets.doctor1,
    name: "Dr. Ana Popescu",
    speciality: "Therapy for anxiety",
    discount: 12,
    livePrice: 90,
    chatPrice: 30,
    rating: RatingModel(rating: 4.7, ratingCount: 65),
  ),
  SessionsForYouModel(
    image: AppAssets.doctor2,
    name: "Dr. Ioana Dobre",
    speciality: "Self-esteem therapy",
    discount: 0,
    livePrice: 100,
    chatPrice: 35,
    rating: RatingModel(rating: 4.9, ratingCount: 121),
  ),
  SessionsForYouModel(
    image: AppAssets.doctor3,
    name: "Andrei Radu",
    speciality:
        "Licensed psychologist. Stress management, burnout and emotional balance.",
    discount: 16,
    livePrice: 85,
    chatPrice: 28,
    rating: RatingModel(rating: 4.5, ratingCount: 95),
  ),
];

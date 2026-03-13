import '../../../../../core/theming/app_assets.dart';
import '../therapist_model.dart';
import '../therapist_rating_summary.dart';


class DummyTherapists {
  static List<TherapistModel> dummyTherapists = List.generate(
    5,
    (index) => TherapistModel(
      id: "therapist_$index",
      image: AppAssets.dummyImage,
      name: "Dr. John Doe $index",
      speciality: "Psychologist",
      about:
          "Experienced therapist specialized in helping people deal with stress, anxiety, and life challenges.",
      discount: 10,
      livePrice: 50,
      chatPrice: 30,
      yearsOfExperience: 8 + index,
      language: "English",
      location: "USA",
      ratingSummary: TherapistRatingSummary(
        rating: 4.5,
        totalCount: 120,
      ),
    ),
  );
}
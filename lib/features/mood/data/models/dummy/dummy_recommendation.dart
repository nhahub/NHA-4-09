import '../recommendation_model.dart';

class DummyRecommendation {
  static final RecommendationModel recommendationDummyModel = RecommendationModel(
    title: "Anger Management",
    description: "Steps to calm down and regain focus. Example.",
    avoid: "Caffeine, social media, ruminating.",
    suggestions: "Deep breathing, short walk, PMR.",
    sections: [
      RecommendationSection(
        category: "Quick Actions",
        items: [
          "4–7–8 deep breaths",
          "Step away from situation",
          "Splash cold water on face",
          "Count backwards from 20",
        ],
      ),
      RecommendationSection(
        category: "Body",
        items: [
          "5–15 min walk",
          "10 min stretching",
          "Progressive muscle relaxation",
        ],
      ),
      RecommendationSection(
        category: "Mental",
        items: [
          "Identify triggering thought",
          "Reframe negative thoughts",
          "Write feelings in journal",
        ],
      ),
      RecommendationSection(
        category: "Avoid",
        items: [
          "Caffeine",
          "Scrolling social media",
          "Ruminating on past conflicts",
        ],
      ),
    ],
  );
}

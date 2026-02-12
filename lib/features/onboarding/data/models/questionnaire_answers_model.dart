class QuestionnaireAnswersModel {
  final String userId;
  final List<String> q1;
  final List<String> q2;
  final List<String> q3;

  QuestionnaireAnswersModel({
    required this.userId,
    required this.q1,
    required this.q2,
    required this.q3,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'q1_answers': q1,
      'q2_answers': q2,
      'q3_answers': q3,
    };
  }
}

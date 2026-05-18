import 'package:json_annotation/json_annotation.dart';

part 'questionnaire_answers_model.g.dart';

@JsonSerializable()
class QuestionnaireAnswersModel {
  @JsonKey(name: 'id')
  final String userId;

  @JsonKey(name: 'q1_answers')
  final List<String> q1;

  @JsonKey(name: 'q2_answers')
  final List<String> q2;

  @JsonKey(name: 'q3_answers')
  final List<String> q3;

  QuestionnaireAnswersModel({
    required this.userId,
    required this.q1,
    required this.q2,
    required this.q3,
  });

  factory QuestionnaireAnswersModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$QuestionnaireAnswersModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$QuestionnaireAnswersModelToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_answers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionnaireAnswersModel _$QuestionnaireAnswersModelFromJson(
  Map<String, dynamic> json,
) => QuestionnaireAnswersModel(
  userId: json['id'] as String,
  q1: (json['q1_answers'] as List<dynamic>).map((e) => e as String).toList(),
  q2: (json['q2_answers'] as List<dynamic>).map((e) => e as String).toList(),
  q3: (json['q3_answers'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$QuestionnaireAnswersModelToJson(
  QuestionnaireAnswersModel instance,
) => <String, dynamic>{
  'id': instance.userId,
  'q1_answers': instance.q1,
  'q2_answers': instance.q2,
  'q3_answers': instance.q3,
};

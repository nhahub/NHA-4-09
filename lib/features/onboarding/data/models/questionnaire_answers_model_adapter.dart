import 'dart:convert';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'questionnaire_answers_model.dart';

class QuestionnaireAnswersModelAdapter extends TypeAdapter<QuestionnaireAnswersModel> {
  @override
  final int typeId = 9;

  @override
  QuestionnaireAnswersModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    final Map<String, dynamic> json = Map<String, dynamic>.from(
      jsonDecode(jsonString),
    );

    return QuestionnaireAnswersModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, QuestionnaireAnswersModel obj) {
    final jsonString = jsonEncode(obj.toJson());
    writer.writeString(jsonString);
  }
}

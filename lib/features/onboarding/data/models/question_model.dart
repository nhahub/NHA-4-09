import 'option_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final List<OptionModel> options;

  const QuestionModel({
    required this.id,
    required this.question,
    required this.options,
  });
}

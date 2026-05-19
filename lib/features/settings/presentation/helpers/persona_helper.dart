import '../../../onboarding/data/models/questionnaire_answers_model.dart';
import '../../data/models/persona_model.dart';
import '../../data/personas.dart';

class PersonaHelper {
  static PersonaModel getPersona(QuestionnaireAnswersModel answers) {
    final allAnswers = {...answers.q1, ...answers.q2, ...answers.q3};

    int countMatches(Set<String> tags) {
      return allAnswers.where(tags.contains).length;
    }

    final scores = personas.map(
      (type, config) => MapEntry(type, countMatches(config.tags)),
    );

    final topPersona = scores.entries.reduce(
      (a, b) => a.value >= b.value ? a : b,
    );

    return personas[topPersona.key]!.persona;
  }
}

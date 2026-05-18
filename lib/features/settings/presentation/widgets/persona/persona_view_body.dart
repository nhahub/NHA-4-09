import 'package:flutter/material.dart';
import '../../../../onboarding/data/models/questionnaire_answers_model.dart';
import '../../../data/models/persona_model.dart';
import '../../helpers/persona_helper.dart';
import 'persona_description.dart';
import 'persona_focus_areas.dart';
import 'persona_result.dart';
import 'personalized_experience_footer.dart';

class PersonaViewBody extends StatelessWidget {
  final QuestionnaireAnswersModel answers;

  const PersonaViewBody({super.key, required this.answers});

  @override
  Widget build(BuildContext context) {
    final PersonaModel persona = PersonaHelper.getPersona(answers);

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: persona.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                PersonaResult(persona: persona),
                const SizedBox(height: 28),
                PersonaDescription(persona: persona),
                const SizedBox(height: 28),
                PersonaFocusAreas(persona: persona),
                const SizedBox(height: 16),
                const PersonalizedExperienceFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


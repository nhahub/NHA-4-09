import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../onboarding/presentation/manager/questionnaire_cubit/questionnaire_cubit.dart';
import 'persona_view_body.dart';

class PersonaBlocBuilder extends StatelessWidget {
  const PersonaBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (QuestionnaireLoadingState):
            return const Center(
              child: CustomCircularProgressIndicator(
                color: AppColors.brandGreen,
              ),
            );
          case const (QuestionnaireLoadedState):
            final answers = (state as QuestionnaireLoadedState).remoteAnswers;
            return PersonaViewBody(answers: answers);
          case const (QuestionnaireFailureState):
            return CustomErrorWidget(
              message: (state as QuestionnaireFailureState).message,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

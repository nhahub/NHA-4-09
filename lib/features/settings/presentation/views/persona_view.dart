import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/onboarding/presentation/manager/questionnaire_cubit/questionnaire_cubit.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../widgets/persona/persona_view_body.dart';

class PersonaView extends StatelessWidget {
  const PersonaView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (QuestionnaireLoadingState):
                return const Center(
                  child: CustomCircularProgressIndicator(
                    color: AppColors.brandGreen,
                  ),
                );
              case const (QuestionnaireLoadedState):
                final answers =
                    (state as QuestionnaireLoadedState).remoteAnswers;
                return PersonaViewBody(answers: answers);
              case const (QuestionnaireFailureState):
                return CustomErrorWidget(
                  message: (state as QuestionnaireFailureState).message,
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../manager/cubit/audio_cubit.dart';
import '../widgets/audio/audio_view_body.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioCubit, AudioState>(
      listener: (context, state) {
        if (state is AudioFailureState) {
          errorDialog(context: context, message: state.message).then((_) {
            if (context.mounted) {
              context.pop();
            }
          });
        }
      },
      child: Scaffold(
        appBar: const BackButtonAppbar(title: "Now playing"),
        body: BlocBuilder<AudioCubit, AudioState>(
          builder: (context, state) {
            if (state is AudioLoadingState) {
              return const Center(
                child: CustomCircularProgressIndicator(
                  color: AppColors.brandGreen,
                ),
              );
            } else if (state is AudioLoadedState) {
              return AudioViewBody(
                audioService: state.audioService,
                audioEntity: state.audioEntity,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

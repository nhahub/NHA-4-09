import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/audio_model.dart';
import '../../data/services/audio_player_service.dart';
import '../manager/audio_player_cubit/audio_player_cubit.dart';
import '../widgets/audio/audio_view_body.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioPlayerCubit, AudioPlayerState>(
      listener: (context, state) {
        if (state is AudioPlayerFailureState) {
          errorDialog(context: context, message: state.message).then((_) {
            if (context.mounted) {
              context.pop();
            }
          });
        }
      },
      child: Scaffold(
        appBar: const BackButtonAppbar(title: "Now playing"),
        body: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
          builder: (context, state) {
            switch (state) {
              case AudioPlayerLoadingState():
                return const Center(
                  child: CustomCircularProgressIndicator(
                    color: AppColors.brandGreen,
                  ),
                );
              case AudioPlayerInitState(
                audioService: final AudioPlayerService service,
                audioModel: final AudioModel model,
              ):
                return AudioViewBody(audioService: service, audioModel: model);
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/audio_error.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/services/audio_player_service.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayerService audioPlayerService;
  final AudioModel audioModel;
  AudioPlayerCubit({required this.audioPlayerService, required this.audioModel})
    : super(AudioPlayerLoadingState());

  Future<void> initAudio({required String audioUrl}) async {
    try {
      await audioPlayerService.init(audioUrl);
      emit(
        AudioPlayerInitState(
          audioService: audioPlayerService,
          audioModel: audioModel,
        ),
      );
    } on AudioLoadException catch (e) {
      emit(AudioPlayerFailureState(message: e.message));
    } on AudioSessionException catch (e) {
      emit(AudioPlayerFailureState(message: e.message));
    } catch (_) {
      emit(const AudioPlayerFailureState(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    audioPlayerService.dispose();
    return super.close();
  }
}

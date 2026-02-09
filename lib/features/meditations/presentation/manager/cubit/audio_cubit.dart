import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/audio_entity.dart';

import '../../../../../core/errors/audio_error.dart';
import '../../../../Community/data/services/audio_player_service.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayerService audioService;
  final AudioEntity audioEntity;
  AudioCubit({required this.audioService, required this.audioEntity})
    : super(AudioLoadingState());

  Future<void> initAudio({required String audioUrl}) async {
    try {
      await audioService.init(audioUrl);
      emit(
        AudioLoadedState(audioEntity: audioEntity, audioService: audioService),
      );
    } on AudioLoadException catch (e) {
      emit(AudioFailureState(message: e.message));
    } on AudioSessionException catch (e) {
      emit(AudioFailureState(message: e.message));
    } catch (_) {
      emit(AudioFailureState(message: "Unexpected error occurred"));
    }
  }

  @override
  Future<void> close() {
    audioService.dispose();
    return super.close();
  }
}

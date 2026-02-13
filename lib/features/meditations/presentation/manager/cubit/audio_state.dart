part of 'audio_cubit.dart';

class AudioState {
  const AudioState();
}

class AudioLoadingState extends AudioState {}

class AudioLoadedState extends AudioState {
  final AudioEntity audioEntity;
  final AudioPlayerService audioService;
  AudioLoadedState({required this.audioEntity, required this.audioService});
}

class AudioFailureState extends AudioState {
  final String message;
  AudioFailureState({required this.message});
}

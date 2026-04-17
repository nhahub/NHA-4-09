part of 'podcast_cubit.dart';

sealed class PodcastState extends Equatable {
  const PodcastState();

  @override
  List<Object?> get props => [];
}

class PodcastLoadingState extends PodcastState {}

class PodcastLoadedState extends PodcastState {
  final List<AudioModel> podcastTracks;

  const PodcastLoadedState({required this.podcastTracks});

  @override
  List<Object?> get props => [podcastTracks];
}

class PodcastFailureState extends PodcastState {
  final String message;
  const PodcastFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

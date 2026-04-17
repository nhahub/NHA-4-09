part of 'asmr_cubit.dart';

sealed class AsmrState extends Equatable {
  const AsmrState();

  @override
  List<Object?> get props => [];
}

class AsmrLoadingState extends AsmrState {}

class AsmrLoadedState extends AsmrState {
  final List<AudioModel> asmrTracks;

  const AsmrLoadedState({required this.asmrTracks});

  @override
  List<Object?> get props => [asmrTracks];
}

class AsmrFailureState extends AsmrState {
  final String message;
  const AsmrFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

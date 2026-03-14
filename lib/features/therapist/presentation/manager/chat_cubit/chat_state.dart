part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitialState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<MessageModel> messages;
  const ChatLoadedState({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatFailureState extends ChatState {
  final String errorMsg;
  const ChatFailureState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

part of 'chatbot_cubit.dart';

sealed class ChatbotState extends Equatable {
  const ChatbotState();

  @override
  List<Object?> get props => [];
}

// ── Sessions ────────────────────────────────────────────────────────────────

class ChatSessionsLoadingState extends ChatbotState {}

class ChatSessionsLoadedState extends ChatbotState {
  final List<ChatSessionModel> sessions;
  const ChatSessionsLoadedState({required this.sessions});

  @override
  List<Object?> get props => [sessions];
}

class ChatSessionsFailureState extends ChatbotState {
  final String message;
  const ChatSessionsFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

// ── Active chat ─────────────────────────────────────────────────────────────

class ChatLoadingState extends ChatbotState {}

class ChatLoadedState extends ChatbotState {
  final List<ChatMessageModel> messages;
  final bool isSending;

  const ChatLoadedState({required this.messages, this.isSending = false});

  ChatLoadedState copyWith({
    List<ChatMessageModel>? messages,
    bool? isSending,
  }) {
    return ChatLoadedState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
    );
  }

  @override
  List<Object?> get props => [messages, isSending];
}

class ChatFailureState extends ChatbotState {
  final String message;
  const ChatFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

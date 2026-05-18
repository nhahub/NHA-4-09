part of 'chat_cubit.dart';

enum ChatStatus { initial, loading, success, failure }

extension ChatStatusX on ChatStatus {
  bool get isInitial => this == ChatStatus.initial;
  bool get isLoading => this == ChatStatus.loading;
  bool get isSuccess => this == ChatStatus.success;
  bool get isFailure => this == ChatStatus.failure;
}

class ChatState extends Equatable {
  final ChatStatus status;
  final List<MessageModel>? messages;
  final bool isSessionEnded;
  final String? userName;
  final String? userImage;
  final String? errorMsg;

  const ChatState({
    this.status = ChatStatus.initial,
    this.isSessionEnded = false,
    this.messages = const [],
    this.userName = '',
    this.userImage = '',
    this.errorMsg,
  });

  @override
  List<Object> get props => [
    status,
    messages ?? [],
    userName ?? '',
    userImage ?? '',
    errorMsg ?? '',
    isSessionEnded,
  ];

  ChatState copyWith({
    ChatStatus? status,
    List<MessageModel>? messages,
    String? userName,
    String? userImage,
    String? errorMsg,
    bool? isSessionEnded,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      errorMsg: errorMsg ?? this.errorMsg,
      isSessionEnded: isSessionEnded ?? this.isSessionEnded,
    );
  }
}

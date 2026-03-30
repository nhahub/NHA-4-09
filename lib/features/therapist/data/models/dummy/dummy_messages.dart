import '../message_model.dart';

class DummyMessages {
  static List<MessageModel> dummyMessages = List.generate(
    10,
    (index) => MessageModel(
      id: "msg_$index",
      roomId: "room_1",
      senderId: index % 2 == 0 ? "user_1" : "therapist_1",
      senderType: index % 2 == 0 ? "user" : "therapist",
      message: index % 2 == 0
          ? "Hello, I need help with anxiety $index"
          : "I'm here to help you. Can you tell me more?",
      createdAt: DateTime.now().subtract(Duration(minutes: index * 5)),
    ),
  );
}

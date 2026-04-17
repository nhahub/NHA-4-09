import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';

class ChatbotView extends StatefulWidget {
  const ChatbotView({super.key});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {
      "text":
          "Hello there! 👋 I'm Mindy, your mental wellness companion.\nHow can I assist you today?",
      "isUser": false,
    },
    {"text": "I'm here to listen. What's on your mind today?", "isUser": false},
    {"text": "I've been feeling stressed lately.", "isUser": true},
    {
      "text":
          "That sounds tough. Would you like to try a short breathing exercise?",
      "isUser": false,
    },
  ];

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({"text": controller.text, "isUser": true});
    });

    controller.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({"text": "I'm here for you 💙", "isUser": false});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Chat with Moodly",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [ChatSettingsWidget()],
      ),

      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6, top: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];

                    return Row(
                      mainAxisAlignment: msg["isUser"]
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: msg["isUser"]
                                  ? const Color(0xff8BC34A)
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(12),
                                topRight: const Radius.circular(12),
                                bottomLeft: msg["isUser"]
                                    ? const Radius.circular(12)
                                    : const Radius.circular(0),
                                bottomRight: msg["isUser"]
                                    ? const Radius.circular(0)
                                    : const Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              msg["text"],
                              style: TextStyle(
                                color: msg["isUser"]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          filled: true,
                          fillColor: const Color(0xffF0F0F0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.mic_none),
                      onPressed: () {},
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff7CB342),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white),
                        onPressed: sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatSettingsWidget extends StatelessWidget {
  const ChatSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black),
      itemBuilder: (context) => const [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.search, size: 18),
              SizedBox(width: 8),
              Text("Search"),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.upload_file, size: 18),
              SizedBox(width: 8),
              Text("Export Chat"),
            ],
          ),
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text("Clear Chat", style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/home/components/conversation_item.dart';

class ChatArea extends StatelessWidget{
  const ChatArea({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20, top: 15),
              margin: const EdgeInsets.only(right: 8),
              child: const Text(
                "Chat",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            const Badge(
              label: Text("34", style: TextStyle(fontSize: 14.5)),
              largeSize: 20,
              backgroundColor: Color.fromARGB(50, 255, 255, 255),
            )
          ],
        ),
        // body
        Column(
          children: const [
            ConversationItem(),
            ConversationItem(),
            ConversationItem()
          ],
        )
      ],
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/conversation_model.dart';
import '../../../../state/home_state.dart';

class ChatAreaHeader extends StatelessWidget{
  const ChatAreaHeader({super.key});
  
  @override
  Widget build(BuildContext context) {
    List<Conversation> conversations = Provider.of<HomeState>(context).conversations;

    return Row(
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
        Badge(
          label: Text(conversations.length.toString(), style: const TextStyle(fontSize: 14.5)),
          largeSize: 20,
          backgroundColor: const Color.fromARGB(50, 255, 255, 255)
        )
      ]
    );
  }
}
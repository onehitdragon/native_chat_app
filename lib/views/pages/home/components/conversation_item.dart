import 'package:flutter/material.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/models/simple_user_model.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:provider/provider.dart';

import 'avatar.dart';

class ConversationItem extends StatelessWidget{
  final Conversation conversation;

  const ConversationItem({super.key, required this.conversation});
  
  @override
  Widget build(BuildContext context) {
    User? me = Provider.of<AuthState>(context).user;
    if(me == null){
      return Container();
    }

    SimpleUser partner = conversation.getPartner(me);
    Message? lastMessage = conversation.getLastMessage();
    SimpleUser? lastMessageSender = lastMessage != null ? conversation.getSender(lastMessage) : null;

    return Row(
      children: [
        const Avatar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  partner.getFullName(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              Text(
                lastMessage == null || lastMessageSender == null ? 
                "No message"
                : 
                "${lastMessageSender.id == me.id ? "Me" : lastMessageSender.getFullName()}: ${lastMessage.content}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
              )
            ],
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.only(right: 10),
              child: const Text(
                "9:41 PM",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(100, 255, 255, 255)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Badge(
                label: Text(
                  "2"
                )
              )
            )
          ],
        )
      ],
    );
  }
}
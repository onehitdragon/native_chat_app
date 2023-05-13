import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/models/simple_user_model.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/util/util.dart';
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

    return InkWell(
      child: Row(
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
                  "${lastMessageSender.id == me.id ? "Me" : lastMessageSender.getFullName()}: ${lastMessage.type == MessageType.text ? lastMessage.content : lastMessage.type == MessageType.icon ? "Send 1 icon" : "Send 1 file"}",
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
                child: Text(
                  lastMessage == null ?
                  ""
                  :
                  convertDateTimeToPresentation(lastMessage.createdAt),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(100, 255, 255, 255)
                  ),
                ),
              ),
              conversation.getMe(me).amountMessageNotRead > 0 ?
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Badge(
                  label: Text(
                    conversation.getMe(me).amountMessageNotRead.toString()
                  )
                )
              ):
              Container()
            ],
          )
        ],
      ),
      onTap: () {
        Provider.of<HomeState>(context, listen: false).setCurrentConversation(conversation);
        context.go("/chat");
      }
    );
  }
}
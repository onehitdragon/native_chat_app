import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/chat/components/content_chat_item.dart';
import 'package:provider/provider.dart';

import '../../../../models/conversation_model.dart';
import '../../../../models/user_model.dart';
import '../../../../state/auth_state.dart';
import '../../../../state/home_state.dart';

class ContentChatArea extends StatelessWidget{
  const ContentChatArea({super.key});
  
  @override
  Widget build(BuildContext context) {
    Conversation? current = Provider.of<HomeState>(context).currentConversation;
    User? me = Provider.of<AuthState>(context).user;

    if(current == null || me == null){
      return Container();
    }

    return Expanded(
      child: ListView(
        children: current.messages.map((message) {
          return ContentChatItem(
            isMe: message.senderId == me.id,
            message: message
          );
        }).toList()
      )
    );
  }
}
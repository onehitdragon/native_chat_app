import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/conversation_model.dart';
import '../../../../state/home_state.dart';
import 'conversation_item.dart';

class ChatAreaBody extends StatelessWidget{
  const ChatAreaBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    List<Conversation> conversations = Provider.of<HomeState>(context).conversations;

    return Expanded(
      child: ListView(
        children: conversations.map((conversation) {
          return ConversationItem(conversation: conversation);
        }).toList()
      )
    );
  }
}
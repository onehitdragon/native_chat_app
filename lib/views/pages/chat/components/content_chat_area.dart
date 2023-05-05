import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/chat/components/content_chat_item.dart';

class ContentChatArea extends StatelessWidget{
  const ContentChatArea({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem(),
          ContentChatItem()
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/util/util.dart';

class ContentChatItem extends StatelessWidget{
  final bool isMe;
  final Message message;

  const ContentChatItem({super.key, required this.isMe, required this.message});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              message.content,
              style: const TextStyle(
                color: Colors.white
              ),
            )
          ),
          Text(
            convertDateTimeToPresentation(message.createdAt),
            style: const TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
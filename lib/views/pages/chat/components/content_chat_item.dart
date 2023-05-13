import 'package:flutter/material.dart';
import 'package:native_chat_app/constant.dart';
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
            child: message.type == MessageType.text ?
            Text(
              message.content,
              style: const TextStyle(
                color: Colors.white
              ),
            )
            :
            message.type == MessageType.icon ?
            SizedBox(
              width: 70,
              height: 70,
              child: Image.network("$serverUrl${message.content}"),
            )
            :
            const Text(
              "fiile",
              style: TextStyle(
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
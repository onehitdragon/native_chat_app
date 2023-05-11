import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/home/components/chat_area_body.dart';
import 'package:native_chat_app/views/pages/home/components/chat_area_header.dart';


class ChatArea extends StatelessWidget{
  const ChatArea({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const [
          ChatAreaHeader(),
          ChatAreaBody()
        ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/home/components/chat_area.dart';
import 'package:native_chat_app/views/pages/home/components/info_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        InfoBar(),
        ChatArea()
      ],
    );
  }
}
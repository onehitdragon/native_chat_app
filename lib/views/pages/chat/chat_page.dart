import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/views/pages/chat/components/chat_info_bar.dart';
import 'package:native_chat_app/views/pages/chat/components/content_chat_area.dart';
import 'package:native_chat_app/views/pages/chat/components/input_chat_bar.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget{
  const ChatPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);

    if(homeState.currentConversation == null){
      Future.delayed(Duration.zero, () {
        context.go("/");
      });
    }
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.gif"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: const [
            ChatInfoBar(),
            ContentChatArea(),
            InputChatBar()
          ],
        ),
      ),
    );
  }
}
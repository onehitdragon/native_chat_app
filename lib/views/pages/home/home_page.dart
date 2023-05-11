import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/service/conversation_service.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/views/pages/home/components/chat_area.dart';
import 'package:native_chat_app/views/pages/home/components/info_bar.dart';
import 'package:provider/provider.dart';

import '../../components/main_navigate_bar.dart';
import '../loading/loading_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    AuthState auth = Provider.of<AuthState>(context);

    if(auth.authing){
      return const LoadingPage();
    }

    HomeState homeState = Provider.of<HomeState>(context, listen: false);
    Future.delayed(Duration.zero, () {
      if(auth.user == null){
        context.go("/login");
      }
      else{
        ConversationService conversationService = ConversationService();
        conversationService.fetchConversations()
        .then((conversations) {
          homeState.setConversations(conversations);
        })
        .catchError((err) {
          context.go("/login");
        });
      }
    });

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
          children: [
            Expanded(
              child: Column(
                children: const [
                  InfoBar(),
                  ChatArea()
                ]
              )
            ),
            const MainNavigateBar()
          ],
        )
      )
    );
  }
}
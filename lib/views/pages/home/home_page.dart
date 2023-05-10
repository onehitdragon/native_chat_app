import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/views/pages/home/components/chat_area.dart';
import 'package:native_chat_app/views/pages/home/components/info_bar.dart';
import 'package:provider/provider.dart';

import '../../components/main_navigate_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    AuthState auth = Provider.of<AuthState>(context);

    Future.delayed(Duration.zero, () async {
      if(auth.user == null){
        context.go("/login");
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
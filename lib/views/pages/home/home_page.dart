import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:native_chat_app/service/conversation_service.dart';
import 'package:native_chat_app/service/icon_service.dart';
import 'package:native_chat_app/service/socket_service.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/state/video_call_state.dart';
import 'package:native_chat_app/views/dialog/custom_video_call_dialog.dart';
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
    User? me = auth.user;

    if(auth.authing){
      return const LoadingPage();
    }

    HomeState homeState = Provider.of<HomeState>(context, listen: false);
    VideoCallState videoCallState = Provider.of<VideoCallState>(context, listen: false);

    Future.delayed(Duration.zero, () {
      if(me == null){
        context.go("/login");
      }
      else{
        if(homeState.conversations == null){
          ConversationService conversationService = ConversationService();
          conversationService.fetchConversations()
          .then((conversations) {
            homeState.setConversations(conversations);
            SocketService socketService = SocketService.getInstance();
            socketService.connect(me);
            socketService.addHaveMessageListener((conversationId, message) {
              homeState.addMessage(conversationId, message);
            });

            socketService.addHaveVideoCallListener((callerPeerId, callerUserId) {
              showDialog(context: context, builder: (context) {
                return CustomVideoCallDialog(title: "$callerUserId...", text: "calling...");
              }, barrierDismissible: false);

              videoCallState.initPeer(() {
                showDialog(context: context, builder: (context) {
                  return CustomVideoCallDialog(
                    title: "$callerUserId...",
                    text: "accepting..."
                  );
                }, barrierDismissible: false);

                videoCallState.setRemotePeerId(callerPeerId);
                socketService.answerVideoCall(videoCallState.peer!.id!, callerUserId);
                context.go("/videocall");
              });
            });
          })
          .catchError((err) {
            context.go("/login");
          });

          IconService iconService = IconService();
          iconService.fetchIcons()
          .then((chatIcons) {
            homeState.setChatIcons(chatIcons);
          });
        }
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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:native_chat_app/service/socket_service.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/state/video_call_state.dart';
import 'package:native_chat_app/views/dialog/custom_video_call_dialog.dart';
import 'package:native_chat_app/views/pages/home/components/avatar.dart';
import 'package:provider/provider.dart';

import '../../../../models/simple_user_model.dart';
import '../../../dialog/custom_alert_dialog.dart';

class ChatInfoBar extends StatelessWidget{
  const ChatInfoBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    Conversation? current = Provider.of<HomeState>(context).currentConversation;
    User? me = Provider.of<AuthState>(context).user;
    VideoCallState videoCallState = Provider.of<VideoCallState>(context, listen: false);

    if(current == null || me == null){
      return Row();
    }
    SimpleUser partner = current.getPartner(me);

    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            context.go("/");
          },
        ),
        const Avatar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  current.getPartner(me).getFullName(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Badge(
                    label: Text("1", style: TextStyle(color: Colors.transparent)),
                    backgroundColor: Colors.green,
                    smallSize: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      "Online",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(100, 255, 255, 255)
                      )
                    )
                  )
                ],
              )
            ],
          )
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.call_outlined,
                color: Colors.white
              ),
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return CustomVideoCallDialog(
                    title: "Calling to ${partner.getFullName()}",
                    text: "connecting..."
                  );
                }, barrierDismissible: false);

                videoCallState.initPeer(() {
                  Navigator.pop(context);
                  showDialog(context: context, builder: (context) {
                    return CustomVideoCallDialog(
                      title: "Calling to ${partner.getFullName()}",
                      text: "establishing..."
                    );
                  });

                  SocketService socketService = SocketService.getInstance();
                  socketService.addClientOfflineListener(() {
                    Navigator.pop(context);
                    showDialog(context: context, builder: (context) {
                      return CustomAlertDialog(
                        title: "Sorry", 
                        text: "${partner.getFullName()} is offline");
                    });

                    videoCallState.detroy();
                    socketService.removeClientOfflineListener();
                  });
                  socketService.addAcceptVideoCallListener((answererPeerId, answererUserId) {
                    videoCallState.setRemotePeerId(answererPeerId);
                    context.go("/videocall");
                  });

                  socketService.callVideo(videoCallState.peer!.id!, partner.id);
                  videoCallState.setIsCaller(true);
                });
              }
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
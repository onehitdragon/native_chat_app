import 'package:flutter/material.dart';
import 'package:native_chat_app/models/chaticon_model.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/state/icon_area_state.dart';
import 'package:provider/provider.dart';

import '../../../../constant.dart';
import '../../../../models/conversation_model.dart';
import '../../../../models/message_model.dart';
import '../../../../models/user_model.dart';
import '../../../../service/message_service.dart';
import '../../../../service/socket_service.dart';

class InputIconChoices extends StatelessWidget{
  final ChatIcon activeChatIcon;

  const InputIconChoices({super.key, required this.activeChatIcon});

  void sendMessage(String chatIconUrl, User me, Conversation current, Function(Message) onComplete){
    MessageService messageService = MessageService();
    messageService.createIconMessage(current.id, chatIconUrl)
    .then((newMessage) {
      SocketService socketService = SocketService.getInstance();
      socketService.sendMessage(
        current.getPartner(me).id,
        current.id,
        newMessage
      );
      onComplete(newMessage);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    Conversation? current = homeState.currentConversation;
    AuthState authState = Provider.of<AuthState>(context);
    User? me = authState.user;
    IconAreaState iconAreaState = Provider.of<IconAreaState>(context);

    if(current == null || me == null){
      return Container();
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(80, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: activeChatIcon.icons.map((chatIconUrl) {
            return GestureDetector(
              onTap: () {
                sendMessage("${activeChatIcon.base}/$chatIconUrl", me, current, (message) {
                  homeState.addMessageToCurrent(message);
                  iconAreaState.setIsOpen(false);
                });
              },
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.network("$serverUrl${activeChatIcon.base}/$chatIconUrl")
              )
            );
          }).toList()
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/service/message_service.dart';
import 'package:native_chat_app/service/socket_service.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:provider/provider.dart';

import '../../../../models/user_model.dart';
import '../../../../state/icon_area_state.dart';

class InputChatBar extends StatefulWidget{
  const InputChatBar({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _InputChatBarState();
  }
}

class _InputChatBarState extends State<InputChatBar>{
  final TextEditingController _txtController = TextEditingController(text: "");

  void sendMessage(User me, Conversation current, Function(Message) onComplete){
    final content = _txtController.text;
    setState(() {
      _txtController.text = "";
    });
    MessageService messageService = MessageService();
    messageService.createTextMessage(current.id, content)
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

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(25, 255, 255, 255),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              color: Colors.white,
            )
          ),
          Expanded(
            child: TextField(
              autofocus: true,
              cursorColor: const Color.fromARGB(125, 255, 255, 255),
              style: const TextStyle(
                color: Color.fromARGB(200, 255, 255, 255)
              ),
              decoration: const InputDecoration(
                focusColor: Colors.transparent,
                border: InputBorder.none,
                hintText: "Input something to chat...",
                hintStyle: TextStyle(
                  color: Color.fromARGB(125, 255, 255, 255)
                )
              ),
              controller: _txtController,
              onChanged: (value) {
                setState(() {
                  _txtController.text = value;
                  _txtController.selection = TextSelection.fromPosition(
                    TextPosition(offset: value.length)
                  );
                });
              },
            ),
          ),
          Row(
            children: [
              Visibility(
                visible: _txtController.text != "",
                child: IconButton(
                  onPressed: () {
                    sendMessage(me, current, (newMessage) {
                      homeState.addMessageToCurrent(newMessage);
                    });
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ),
              IconButton(
                onPressed: () {
                  iconAreaState.setIsOpen(!iconAreaState.isOpen);
                },
                icon: const Icon(
                  Icons.tag_faces_rounded,
                  color: Colors.white
                )
              )
            ],
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:native_chat_app/models/chaticon_model.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/state/icon_area_state.dart';
import 'package:native_chat_app/views/pages/chat/components/input_icon_choices.dart';
import 'package:native_chat_app/views/pages/chat/components/menu_icon.dart';
import 'package:provider/provider.dart';

class InputIconArea extends StatefulWidget{
  const InputIconArea({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return InputIconAreaState();
  }
}

class InputIconAreaState extends State<InputIconArea>{
  ChatIcon? currentChatIcon;

  @override
  Widget build(BuildContext context) {
    List<ChatIcon>? chatIcons = Provider.of<HomeState>(context).chatIcons;
    bool isOpen = Provider.of<IconAreaState>(context).isOpen;

    if(chatIcons == null){
      return Container();
    }

    return Positioned(
      width: isOpen ? 260 : 0,
      height: isOpen ? 260 : 0,
      bottom: 60,
      right: 20,
      child: Row(
        children: [
          MenuIcon(
            chatIcons: chatIcons,
            activeChatIcon: currentChatIcon ?? chatIcons[0],
            onTap: (chatIcon) {
              setState(() {
                currentChatIcon = chatIcon;
              });
            },
          ),
          InputIconChoices(activeChatIcon: currentChatIcon ?? chatIcons[0])
        ]
      )
    );
  }
}
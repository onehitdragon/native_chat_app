import 'package:flutter/material.dart';
import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/chaticon_model.dart';

class MenuIcon extends StatelessWidget{
  final List<ChatIcon> chatIcons;
  final ChatIcon activeChatIcon;
  final Function(ChatIcon) onTap;

  const MenuIcon({super.key, 
    required this.chatIcons,
    required this.activeChatIcon,
    required this.onTap
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chatIcons.map((chatIcon) {
        return chatIcon == activeChatIcon ? 
        MenuIconItem(active: true, chatIcon: chatIcon, onTap: onTap)
        :
        MenuIconItem(chatIcon: chatIcon, onTap: onTap);
      }).toList()
    );
  }
}

class MenuIconItem extends StatelessWidget{
  final ChatIcon chatIcon;
  final bool active;
  final Function(ChatIcon) onTap;

  const MenuIconItem({super.key, this.active = false, required this.chatIcon, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(chatIcon);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: active ? 
          const Color.fromARGB(150, 255, 255, 255)
          :
          const Color.fromARGB(80, 255, 255, 255)
        ),
        height: 35,
        width: 35,
        child: Image.network("$serverUrl${chatIcon.base}/${chatIcon.icons[0]}")
      )
    );
  }
}
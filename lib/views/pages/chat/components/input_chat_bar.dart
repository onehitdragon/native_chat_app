import 'package:flutter/material.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/service/message_service.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:provider/provider.dart';

class InputChatBar extends StatefulWidget{
  const InputChatBar({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _InputChatBarState();
  }
}

class _InputChatBarState extends State<InputChatBar>{
  final TextEditingController _txtController = TextEditingController(text: "");

  void sendMessage(Conversation current, Function(Message) onComplete){
    final content = _txtController.text;
    setState(() {
      _txtController.text = "";
    });
    MessageService messageService = MessageService();
    messageService.createTextMessage(current.id, content)
    .then((newMessage) {
      onComplete(newMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Provider.of<HomeState>(context);
    Conversation? current = homeState.currentConversation;

    if(current == null){
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
                    sendMessage(current, (newMessage) {
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
                onPressed: () {},
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
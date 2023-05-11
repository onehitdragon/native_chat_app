import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/views/pages/home/components/avatar.dart';
import 'package:provider/provider.dart';

class ChatInfoBar extends StatelessWidget{
  const ChatInfoBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    Conversation? current = Provider.of<HomeState>(context).currentConversation;
    User? me = Provider.of<AuthState>(context).user;

    if(current == null || me == null){
      return Row();
    }

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
              onPressed: () { }
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
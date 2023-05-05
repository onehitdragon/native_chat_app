import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/home/components/avatar.dart';

class ChatInfoBar extends StatelessWidget{
  const ChatInfoBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        const Avatar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Text(
                  "Nguyen Van C",
                  style: TextStyle(
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
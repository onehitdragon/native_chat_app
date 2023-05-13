import 'package:flutter/material.dart';
import 'package:native_chat_app/models/chaticon_model.dart';

import '../../../../constant.dart';

class InputIconChoices extends StatelessWidget{
  final ChatIcon activeChatIcon;

  const InputIconChoices({super.key, required this.activeChatIcon});
  
  @override
  Widget build(BuildContext context) {
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
          children: activeChatIcon.icons.map((chatIcon) {
            return SizedBox(
              width: 70,
              height: 70,
              child: Image.network("$serverUrl${activeChatIcon.base}/$chatIcon")
            );
          }).toList()
        )
      )
    );
  }
}
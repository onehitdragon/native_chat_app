import 'package:flutter/material.dart';

class InputChatBar extends StatefulWidget{
  const InputChatBar({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _InputChatBarState();
  }
}

class _InputChatBarState extends State<InputChatBar>{
  final TextEditingController _txtController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      _txtController.text = "";
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
import 'package:flutter/material.dart';

class ContentChatItem extends StatelessWidget{
  const ContentChatItem({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: const Text(
              "Wanna lunch with me ?",
              style: TextStyle(
                color: Colors.white
              ),
            )
          ),
          const Text(
            "12:38 PM",
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
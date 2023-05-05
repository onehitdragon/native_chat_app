import 'package:flutter/material.dart';

import 'avatar.dart';

class ConversationItem extends StatelessWidget{
  const ConversationItem({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Avatar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Text(
                  "Nguyen Van B",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              const Text(
                "What food do you like ?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),
              )
            ],
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.only(right: 10),
              child: const Text(
                "9:41 PM",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(100, 255, 255, 255)
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Badge(
                label: Text(
                  "2"
                )
              ),
            )
          ],
        )
      ],
    );
  }
}
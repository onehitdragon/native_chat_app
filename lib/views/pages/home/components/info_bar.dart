import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget{
  const InfoBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // avatar
        Container(
          padding: const EdgeInsets.all(10),
          width: 70,
          height: 70,
          child: Image.asset("images/avatar.png")
        ),
        // info
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: const Text(
                  "Nguyen Van A",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                )
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 18,
                    height: 18,
                    child: Image.asset("images/working.png")
                  ),
                  const Text(
                    "At work",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(218, 255, 255, 255)
                    ),
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
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () { },
            ),
            IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: () { },
            )
          ],
        )
      ],
    );
  }

}
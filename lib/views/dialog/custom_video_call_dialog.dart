import 'package:flutter/material.dart';

class CustomVideoCallDialog extends StatelessWidget{
  final String title;
  final String text;

  const CustomVideoCallDialog({super.key, required this.title, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text(text)
        )
      ]
    );
  }
}
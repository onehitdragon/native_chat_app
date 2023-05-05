import 'package:flutter/material.dart';

class Avatar extends StatelessWidget{
  const Avatar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 70,
      height: 70,
      child: Image.asset("images/avatar.png")
    );
  }

}
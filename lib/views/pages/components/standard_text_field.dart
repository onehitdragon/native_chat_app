import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget{
  final String? hintText;
  final Function(String value)? onChanged;

  const StandardTextField({super.key, this.onChanged, this.hintText});
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(
          color: Color.fromARGB(100, 255, 255, 255)
        )
      ),
      style: const TextStyle(
        color: Colors.white
      ),
      onChanged: onChanged,
    );
  }
}
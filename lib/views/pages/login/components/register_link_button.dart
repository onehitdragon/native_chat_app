import 'package:flutter/material.dart';

class RegisterLinkButton extends StatelessWidget{
  const RegisterLinkButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.red
      ),
      child: const Text(
        "I don't have an account",
        style: TextStyle(
          color: Color.fromARGB(100, 255, 255, 255),
          decoration: TextDecoration.underline
        )
      ),
    );
  }
}
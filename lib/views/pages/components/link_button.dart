import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget{
  final String label;
  final void Function()? onPressed;

  const LinkButton(this.label, {super.key, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.red
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color.fromARGB(100, 255, 255, 255),
          decoration: TextDecoration.underline
        )
      )
    );
  }
}
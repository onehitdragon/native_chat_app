import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/components/standard_scure_field.dart';
import 'package:native_chat_app/views/pages/components/standard_text_field.dart';

class RegisterForm extends StatelessWidget{
  const RegisterForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StandardTextField(
              hintText: "Your name...",
            ),
            const StandardTextField(
              hintText: "Your email...",
            ),
            const StandartScureField(
              hintText: "Your password...",
            ),
            const StandardTextField(
              hintText: "Your phone...",
            ),
            const StandardTextField(
              hintText: "Your birthday...",
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: const Size(100, 40),
                foregroundColor: Colors.red
              ),
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              ),
            )
          ],
        )
      ]
    );
  }
}
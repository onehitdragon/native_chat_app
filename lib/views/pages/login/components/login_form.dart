import 'package:flutter/material.dart';
import 'package:native_chat_app/views/pages/components/standard_text_field.dart';
import 'package:native_chat_app/views/pages/components/standard_scure_field.dart';

class LoginForm extends StatelessWidget{
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const StandardTextField(
            hintText: "Your username..."
          ),
          const StandartScureField(
            hintText: "Your password..."
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(100, 40),
              foregroundColor: Colors.red
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          )
        ]
      );
  }
}


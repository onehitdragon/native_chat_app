import 'package:flutter/material.dart';
import 'package:native_chat_app/models/user_creation_model.dart';
import 'package:native_chat_app/service/user_service.dart';
import 'package:native_chat_app/views/dialog/custom_alert_dialog.dart';
import 'package:native_chat_app/views/pages/components/standard_scure_field.dart';
import 'package:native_chat_app/views/pages/components/standard_text_field.dart';

class RegisterForm extends StatelessWidget{
  final UserCreation userCreation = UserCreation();

  RegisterForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StandardTextField(
              hintText: "Your name...",
              onChanged: (value) {
                final names = value.split(" ");
                final f = names[names.length - 1];
                names[names.length - 1] = "";
                final l = names.join(" ");
                userCreation.firstName = f;
                userCreation.lastName = l;
              },
            ),
            StandardTextField(
              hintText: "Your email...",
              onChanged: (value) {
                userCreation.email = value;
              },
            ),
            StandartScureField(
              hintText: "Your password...",
              onChanged: (value) {
                userCreation.password = value;
              },
            ),
            StandardTextField(
              hintText: "Your phone...",
              onChanged: (value) {
                userCreation.phone = value;
              },
            ),
            StandardTextField(
              hintText: "Your birthday...",
              onChanged: (value) {
                userCreation.birthDay = DateTime.tryParse(value) ?? DateTime.now();
              },
            ),
            TextButton(
              onPressed: () {
                UserService userService = UserService();
                userService.register(userCreation)
                .then((value) {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomAlertDialog(title: "Success", text: "Register ok")
                  );
                })
                .catchError((err) {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomAlertDialog(title: "Sorry", text: "Error")
                  );
                });
              },
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
import 'package:flutter/material.dart';
import 'package:native_chat_app/service/auth_service.dart';
import 'package:native_chat_app/views/dialog/custom_alert_dialog.dart';
import 'package:native_chat_app/views/pages/components/standard_text_field.dart';
import 'package:native_chat_app/views/pages/components/standard_scure_field.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>{
  String username = "";
  String password = "";
  bool isLogining = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StandardTextField(
            hintText: "Your username...",
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          StandartScureField(
            hintText: "Your password...",
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          TextButton(
            onPressed: () {
              AuthService authService = AuthService();
              authService.fetchLogin(username, password).then((auth) {
                if(auth == null){
                  showDialog(context: context, builder: (context) {
                    return const CustomAlertDialog(
                      title: "Login fail",
                      text: "Username or password is wrong!");
                  });
                }
              })
              .catchError((err) {
                showDialog(context: context, builder: (context) {
                  return const CustomAlertDialog(
                    title: "Service fail",
                    text: "Maybe server is closed!");
                });
              });
            },
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
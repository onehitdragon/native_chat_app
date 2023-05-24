import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/views/pages/components/link_button.dart';
import 'package:native_chat_app/views/pages/register/components/register_form.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.gif"),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 80, left: 45, right: 45, bottom: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegisterForm(),
              LinkButton(
                "I have account already",
                onPressed: () {
                  context.go("/login");
                }
              )
            ]
          ),
        )
      )
    );
  }
}
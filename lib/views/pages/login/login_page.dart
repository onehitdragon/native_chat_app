import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/views/pages/components/link_button.dart';
import 'package:native_chat_app/views/pages/loading/loading_page.dart';
import 'package:native_chat_app/views/pages/login/components/login_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    print("reload login...");
    AuthState auth = Provider.of<AuthState>(context);

    if(auth.authing){
      return const LoadingPage();
    }
    
    Future.delayed(Duration.zero, () {
      if(auth.user != null){
        context.go("/");
      }
    });

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
              const LoginForm(),
              LinkButton(
                "I don't have an account",
                onPressed: () {
                  context.go("/register");
                }
              )
            ]
          ),
        )
      )
    );
  }
}
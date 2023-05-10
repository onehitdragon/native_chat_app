import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/views/pages/home/home_page.dart';
//import 'package:native_chat_app/views/pages/chat/chat_page.dart';
import 'package:native_chat_app/views/pages/login/login_page.dart';
import 'package:native_chat_app/views/pages/register/register_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:native_chat_app/constant.dart';
import 'package:dio/dio.dart';

import '../../models/user_model.dart';
import '../../service/user_service.dart';


class App extends StatefulWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
      )
    ]
  );

  App({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  bool authing = false;

  AppState(){
    //api.interceptors.add(LogInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    AuthState auth = Provider.of<AuthState>(context);
    
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      if(token != null){
        setAuthorizeHeader(token);
        UserService userService = UserService();
        User? user = await userService.fetchUser();
      }
    });

    return MaterialApp.router(
      routerConfig: widget._router,
      debugShowCheckedModeBanner: false
    );
  }
}
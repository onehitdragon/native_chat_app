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

import '../../models/user_model.dart';
import '../../service/user_service.dart';


class App extends StatelessWidget {
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
  Widget build(BuildContext context) {
    debugPrint("authing...");
    AuthState auth = Provider.of<AuthState>(context, listen: false);
    
    SharedPreferences.getInstance()
    .then<User?>((prefs) {
      String? token = prefs.getString("token");
      if(token == null) return null;

      setAuthorizeHeader(token);
      UserService userService = UserService();
      return userService.fetchUser();
    })
    .then((user) {
      if(user != null){
        auth.setUser(user);
      }
    })
    .whenComplete(() {
      Future.delayed(const Duration(milliseconds: 1000), () {
        auth.setAuthing(false);
      });
    });

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false
    );
  }
}
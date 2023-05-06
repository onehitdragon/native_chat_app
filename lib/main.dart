import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_chat_app/views/pages/login/login_page.dart';
import 'package:native_chat_app/views/pages/register/register_page.dart';
//import 'package:native_chat_app/views/pages/home/home_page.dart';
//import 'package:native_chat_app/views/pages/chat/chat_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: "/register",
        builder: (context, state) => const RegisterPage(),
      ),
      // GoRoute(
      //   path: "/",
      //   builder: (context, state) => const HomePage(),
      // )
    ]
  );

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false
    );
  }
}

import 'package:flutter/material.dart';
import 'package:native_chat_app/views/components/main_navigate_bar.dart';
import 'package:native_chat_app/views/pages/home/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.gif"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    HomePage()
                  ],
                )
              ),
              const MainNavigateBar()
            ],
          )
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:native_chat_app/views/components/main_navigate_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 93, 65, 87),
                Color.fromARGB(255, 168, 202, 186)
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp
            )
          ),
          child: Column(
            children: const [
              Expanded(
                child: Text("abc"),
              ),
              MainNavigateBar()
            ],
          )
        )
      ),
    );
  }
}

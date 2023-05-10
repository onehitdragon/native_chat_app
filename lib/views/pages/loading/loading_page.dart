import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});
  
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
        child: const Center(
          child: Text("Loading...", style: TextStyle(color: Colors.white))
        )
      )
    );
  }
}
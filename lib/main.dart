import 'package:flutter/material.dart';
import 'package:native_chat_app/state/auth_state.dart';
import 'package:native_chat_app/state/home_state.dart';
import 'package:native_chat_app/state/icon_area_state.dart';
import 'package:native_chat_app/state/video_call_state.dart';
import 'package:native_chat_app/views/pages/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthState()
        ),
        ChangeNotifierProvider(
          create: (context) => HomeState()
        ),
        ChangeNotifierProvider(
          create: (context) => IconAreaState()
        ),
        ChangeNotifierProvider(
          create: (context) => VideoCallState()
        )
      ],
      child: App()
    );
  }
}

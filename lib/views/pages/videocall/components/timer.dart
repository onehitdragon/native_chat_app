import 'package:flutter/material.dart';

import '../../../../util/util.dart';

class Timer extends StatefulWidget{
  const Timer({super.key});

  @override
  State<StatefulWidget> createState() {
    return TimerState();
  }
}

class TimerState extends State<Timer>{
  @override
  int time = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        time++;
      });
    });

    return Text(
      convertNumberToTime(time),
      style: const TextStyle(
        color: Color.fromARGB(200, 255, 255, 255)
      ),
    );
  }
}
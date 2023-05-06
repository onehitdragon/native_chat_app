import 'package:flutter/material.dart';

class StandartScureField extends StatefulWidget{
  final String? hintText;
  final void Function(String value)? onChanged;

  const StandartScureField({super.key, this.hintText, this.onChanged});

  @override
  State<StatefulWidget> createState() {
    return _StandartScureFieldState();
  }
}

class _StandartScureFieldState extends State<StandartScureField>{
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            obscureText: !_isShow,
            obscuringCharacter: "+",
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(100, 255, 255, 255)
              )
            ),
            style: const TextStyle(
              color: Colors.white
            ),
            onChanged: widget.onChanged,
          )
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isShow = !_isShow;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: _isShow ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(100, 255, 255, 255)
          )
        )
      ],
    );
  }
}
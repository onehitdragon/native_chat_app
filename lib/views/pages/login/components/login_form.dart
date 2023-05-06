import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget{
  const LoginForm({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Your username...",
              hintStyle: TextStyle(
                color: Color.fromARGB(100, 255, 255, 255)
              )
            ),
            style: TextStyle(
              color: Colors.white
            )
          ),
          _PasswordField(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: const Size(100, 40),
              foregroundColor: Colors.red
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          )
        ],
      );
  }
}

class _PasswordField extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PasswordFieldState();
  }
}

class _PasswordFieldState extends State<_PasswordField>{
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            obscureText: !_isShow,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Your password...",
              hintStyle: TextStyle(
                color: Color.fromARGB(100, 255, 255, 255)
              )
            ),
            style: const TextStyle(
              color: Colors.white
            )
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
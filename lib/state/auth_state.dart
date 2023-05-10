import 'package:flutter/foundation.dart';
import 'package:native_chat_app/models/user_model.dart';

class AuthState extends ChangeNotifier{
  User? user;
  bool authing = true;

  void setUser(User? user){
    this.user = user;
    notifyListeners();
  }

  void setAuthing(bool authing){
    this.authing = authing;
    notifyListeners();
  }
}
import 'dart:convert';
import 'package:native_chat_app/constant.dart';

import '../models/user_model.dart';

class UserService{
  Future<User?> fetchUser() async{
    final res = await api.get("/user");

    if(res.statusCode == 200){
      final userJson = jsonDecode(res.data).content.user;
      return User.fromJson(userJson);
    }

    return null;
  }
}
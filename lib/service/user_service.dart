import 'package:native_chat_app/constant.dart';

import '../models/user_model.dart';

class UserService{
  Future<User> fetchUser() async{
    final res = await api.get("/user");

    return User.fromJson(res.data["content"]["user"]);
  }
}
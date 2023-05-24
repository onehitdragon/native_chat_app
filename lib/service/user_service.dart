import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/user_creation_model.dart';

import '../models/user_model.dart';

class UserService{
  Future<User> fetchUser() async{
    final res = await api.get("/user");

    return User.fromJson(res.data["content"]["user"]);
  }

  Future<void> register(UserCreation userCreation) async{
    await api.post("/auth/register", data: {
        "email": userCreation.email,
        "password": userCreation.password,
        "firstName": userCreation.firstName,
        "lastName": userCreation.lastName,
        "birthDay": userCreation.birthDay.toString(),
        "phone": userCreation.phone
    });
  }
}
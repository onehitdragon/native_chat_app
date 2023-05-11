import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/auth_model.dart';

class AuthService {
  Future<Auth?> fetchLogin(String email, String password) async{
    final res = await api.post("/auth/login", data: {
      'email': email,
      'password': password
    });

    if(res.data["status"] == "error"){
      return null;
    }

    return Auth.fromJson(res.data);
  }
}
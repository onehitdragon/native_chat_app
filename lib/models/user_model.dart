import 'package:native_chat_app/models/simple_user_model.dart';

class User extends SimpleUser{
  String email;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDay,
    required super.role,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phone: json["phone"],
      birthDay: DateTime.parse(json["birthDay"]).toLocal(),
      role: json["role"],
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      updatedAt: DateTime.parse(json["updatedAt"]).toLocal()
    );
  }
}

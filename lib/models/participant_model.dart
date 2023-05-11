import 'package:native_chat_app/models/simple_user_model.dart';

class Participant extends SimpleUser{
  int amountMessageNotRead;

  Participant({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDay,
    required super.role,
    required this.amountMessageNotRead
  });

  factory Participant.fromJson(Map<String, dynamic> json){
    return Participant(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      birthDay: DateTime.parse(json["birthDay"]),
      role: json["role"],
      amountMessageNotRead: json["Participant"]["amountMessageNotRead"]
    );
  }
}
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/models/participant_model.dart';
import 'package:native_chat_app/models/simple_user_model.dart';
import 'package:native_chat_app/models/user_model.dart';

class Conversation{
  String id;
  String title;
  SimpleUser creator;
  List<Participant> participatedUsers;
  List<Message> messages;
  DateTime createdAt;
  DateTime updatedAt;

  Conversation({
    required this.id,
    required this.title,
    required this.creator,
    required this.participatedUsers,
    required this.messages,
    required this.createdAt,
    required this.updatedAt
  });

  factory Conversation.fromJson(Map<String, dynamic> json){
    return Conversation(
      id: json["id"],
      title: json["title"],
      creator: SimpleUser.fromJson(json["Creator"]),
      participatedUsers: (json["ParticipatedUsers"] as List<dynamic>).map((p) => Participant.fromJson(p)).toList(),
      messages: (json["Messages"] as List<dynamic>).map((m) => Message.fromJson(m)).toList(),
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      updatedAt: DateTime.parse(json["updatedAt"]).toLocal()
    );
  }

  Participant getMe(User me){
    return participatedUsers.firstWhere((participant) => participant.id == me.id);
  }

  Participant getPartner(User me){
    return participatedUsers.firstWhere((participant) => participant.id != me.id);
  }

  Message? getLastMessage(){
    if(messages.isNotEmpty){
      return messages[messages.length - 1];
    }

    return null;
  }

  Participant getSender(Message message){
    return participatedUsers.firstWhere((participant) => participant.id == message.senderId);
  }
}
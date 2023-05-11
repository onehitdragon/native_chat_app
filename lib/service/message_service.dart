import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/message_model.dart';

class MessageService{
  Future<Message> createTextMessage(String conversationId, String content) async {
    final res = await api.post("/message", data: {
      "conversationId": conversationId,
      "content": content
    });

    return Message.fromJson(res.data["content"]["message"]);
  }
}
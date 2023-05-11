import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/conversation_model.dart';

class ConversationService{
  Future<List<Conversation>> fetchConversations() async {
    final res = await api.get("/conversation");
    
    final List<dynamic> conversations = res.data["content"]["conversations"];
    return conversations.map((c) => Conversation.fromJson(c)).toList();
  }
}
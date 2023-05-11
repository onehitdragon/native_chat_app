import 'package:flutter/foundation.dart';
import 'package:native_chat_app/models/conversation_model.dart';

class HomeState extends ChangeNotifier{
  List<Conversation> conversations = [];

  void setConversations(List<Conversation> conversations){
    this.conversations = conversations;
    notifyListeners();
  }
}
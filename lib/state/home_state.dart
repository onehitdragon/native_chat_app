import 'package:flutter/foundation.dart';
import 'package:native_chat_app/models/conversation_model.dart';
import 'package:native_chat_app/models/message_model.dart';

class HomeState extends ChangeNotifier{
  List<Conversation> conversations = [];
  Conversation? currentConversation;

  void setConversations(List<Conversation> conversations){
    this.conversations = conversations;
    notifyListeners();
  }

  void setCurrentConversation(Conversation? conversation){
    currentConversation = conversation;
    notifyListeners();
  }

  void addMessageToCurrent(Message message){
    final currentConversation = this.currentConversation;
    if(currentConversation != null){
      currentConversation.messages.add(message);
      notifyListeners();
    }
  }
}
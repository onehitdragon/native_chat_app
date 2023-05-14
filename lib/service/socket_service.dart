import 'package:flutter/material.dart';
import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/message_model.dart';
import 'package:native_chat_app/models/user_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService{
  static SocketService? _instance;
  Socket socket;

  SocketService._(this.socket);

  static SocketService getInstance(){
    return _instance ??= SocketService._(
      io(serverUrl)
    );
  }

  void connect(User user){
    socket.onConnect((data) {
      debugPrint("connect to socket...");
      socket.emit("init", user.id);
    });
  }

  void addHaveMessageListener(Function(String conversationId, Message message) onHaveMessage){
    socket.on("have message", (data) {
      onHaveMessage(data[0], Message.fromJson(data[1]));
    });
  }

  void sendMessage(String receiveUserId, String conversationId, Message message){
    socket.emit("send message", [receiveUserId, conversationId, message.toJson()]);
  }

  void callVideo(String callerPeerId, String receiveUserId){
    socket.emit("call video", [callerPeerId, receiveUserId]);
  }

  void addHaveVideoCallListener(Function(String callerPeerId, String callerUserId) onHaveVideoCall){
    socket.on("have video call", (data) {
      onHaveVideoCall(data[0], data[1]);
    });
  }

  void answerVideoCall(String answererPeerId, String receiveUserId){
    socket.emit("answer video call", [answererPeerId, receiveUserId]);
  }

  void addAcceptVideoCallListener(Function(String answererPeerId, String answererUserId) onAcceptVideoCall){
    socket.on("accept video call", (data) {
      onAcceptVideoCall(data[0], data[1]);
    });
  }

  void addClientOfflineListener(Function() onClientOffline){
    socket.on("client offline", (data) {
      onClientOffline();
    });
  }

  void removeClientOfflineListener(){
    socket.off("client offline");
  }
}
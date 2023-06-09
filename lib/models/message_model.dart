enum MessageType{
  text,
  file,
  icon
}

class Message{
  String id;
  String content;
  MessageType type;
  String? attachmentUrl;
  String senderId;
  DateTime createdAt;
  DateTime updatedAt;

  Message({
    required this.id,
    required this.content,
    required this.type,
    this.attachmentUrl,
    required this.senderId,
    required this.createdAt,
    required this.updatedAt
  });

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      id: json["id"],
      content: json["content"],
      type: json["type"] == "text" ? MessageType.text : json["type"] == "icon" ? MessageType.icon : MessageType.file,
      attachmentUrl: json["attachmentUrl"],
      senderId: json["senderId"],
      createdAt: DateTime.parse(json["createdAt"]).toLocal(),
      updatedAt: DateTime.parse(json["updatedAt"]).toLocal()
    );
  }

  Map<String, dynamic> toJson(){
    return {
        "id": id,
        "content": content,
        "type": type.name,
        "attachmentUrl": attachmentUrl,
        "createdAt": createdAt.toLocal().toString(),
        "updatedAt": updatedAt.toLocal().toString(),
        "senderId": senderId
    };
  }
}
import 'package:native_chat_app/constant.dart';
import 'package:native_chat_app/models/chaticon_model.dart';

class IconService{
  Future<List<ChatIcon>> fetchIcons() async {
    final res = await api.get("$serverUrl/icons/icons.json");
    
    return (res.data as List<dynamic>).map((iconJson) {
      return ChatIcon.fromJson(iconJson);
    }).toList();
  }
}
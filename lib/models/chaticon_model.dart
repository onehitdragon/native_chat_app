class ChatIcon{
  String name;
  String base;
  List<String> icons;

  ChatIcon({
    required this.name,
    required this.base,
    required this.icons
  });

  factory ChatIcon.fromJson(Map<String, dynamic> json){
    return ChatIcon(
      name: json["name"],
      base: json["base"],
      icons: (json["icons"] as List<dynamic>).map((icon) => icon.toString()).toList()
    );
  }
}
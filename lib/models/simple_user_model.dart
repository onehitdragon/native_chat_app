class SimpleUser{
  String id;
  String firstName;
  String lastName;
  DateTime birthDay;
  String role;

  SimpleUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.role
  });

  String getFullName(){
    return "$lastName $firstName";
  }

  factory SimpleUser.fromJson(Map<String, dynamic> json){
    return SimpleUser(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      birthDay: DateTime.parse(json["birthDay"]).toLocal(),
      role: json["role"]
    );
  }
}
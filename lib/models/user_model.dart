class User{
  String id;
  String email;
  String firstName;
  String lastName;
  DateTime birthDay;
  String phone;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.updatedAt
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      phone: json["phone"],
      birthDay: DateTime.parse(json["birthDay"]),
      role: json["role"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"])
    );
  }

  String getFullName(){
    return "$lastName $firstName";
  }
}

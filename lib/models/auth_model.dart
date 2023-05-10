class Auth{
  String token;
  
  Auth({required this.token});

  factory Auth.fromJson(Map<String, dynamic> json){
    return Auth(token: json["content"]["token"]);
  }
}
import 'package:dio/dio.dart';

final api = Dio(BaseOptions(
  baseUrl: "http://localhost:12345/api/v1",
  contentType: "application/json"
));

void setAuthorizeHeader(String token){
  api.options.headers = { "Authorization": "Bearer $token" };
}
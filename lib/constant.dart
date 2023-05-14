import 'package:dio/dio.dart';

const String serverUrl = "http://localhost:12345";

final api = Dio(BaseOptions(
  baseUrl: "$serverUrl/api/v1",
  contentType: "application/json"
));

void setAuthorizeHeader(String token){
  api.options.headers = { "Authorization": "Bearer $token" };
}

const String peerUrl = "http://localhost:9000";
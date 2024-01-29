import 'package:fpay/Network/Models/LoginData.dart';
class LoginResponse {
  LoginResponse({
      this.data, 
      this.status, 
      this.code, 
      this.message,});

  LoginResponse.fromJson(dynamic json) {
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
  LoginData? data;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}
import 'SelfBankData.dart';

class SelfBankResponse {
  SelfBankResponse({
      this.data, 
      this.status, 
      this.code, 
      this.message,});

  SelfBankResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SelfBankData.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
  List<SelfBankData>? data;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data?.map((v) => v.toJson()).toList();
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}
import 'CreditCardData.dart';

class CreditCardResponse {
  CreditCardResponse({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  CreditCardResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CreditCardData.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  List<CreditCardData>? data;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}

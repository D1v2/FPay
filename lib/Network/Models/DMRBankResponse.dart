import 'DmrBankData.dart';

class DmrBankResponse {
  DmrBankResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  DmrBankResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DmrBankData>[];
      json['data'].forEach((v) {
        data!.add(DmrBankData.fromJson(v));
      });
    }
  }

  bool? status;
  int? code;
  String? message;
  List<DmrBankData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

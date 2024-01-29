import 'QrCodeData.dart';

class QrCodeResponse {
  QrCodeResponse({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  QrCodeResponse.fromJson(dynamic json) {
    data = json['data'] != null ? QrCodeData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  QrCodeData? data;
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

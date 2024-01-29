import 'DoRechargeDataResponse.dart';

class DoRechargeResponse {
  DoRechargeResponse({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  DoRechargeResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = <DoRechargeDataResponse>[];
      json['data'].forEach((v) {
        data!.add(DoRechargeDataResponse.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  List<DoRechargeDataResponse>? data;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

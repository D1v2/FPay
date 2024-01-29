import 'RechargeReportInfoData.dart';

class RechargeReportInfoResponse {
  RechargeReportInfoResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  RechargeReportInfoResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RechargeReportInfoData.fromJson(v));
      });
    }
  }

  bool? status;
  int? code;
  String? message;
  List<RechargeReportInfoData>? data;

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

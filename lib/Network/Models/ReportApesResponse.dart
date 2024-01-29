import 'ReportAepsData.dart';

class ReportApesResponse {
  ReportApesResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  ReportApesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ReportAepsData.fromJson(v));
      });
    }
  }

  bool? status;
  int? code;
  String? message;
  List<ReportAepsData>? data;

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

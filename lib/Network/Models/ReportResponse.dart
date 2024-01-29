import 'ReportData.dart';

class ReportResponse {
  ReportResponse({
      this.status, 
      this.code, 
      this.message, 
      this.data,});

  ReportResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ReportData.fromJson(v));
      });
    }
  }
  bool? status;
  int? code;
  String? message;
  List<ReportData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    map['data'] = data?.map((v) => v.toJson()).toList();
    return map;
  }

}
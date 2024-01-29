class CommonResponse {
  bool? status;
  int? code;
  String? message;
  String? id;
  dynamic? data;

  CommonResponse({this.status, this.code, this.message,this.id});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    id = json['id'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['id'] = id;
    data['data'] = data;
    return data;
  }
}
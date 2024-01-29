class Errors {
  Errors({
      this.errCode, 
      this.message,});

  Errors.fromJson(dynamic json) {
    errCode = json['errCode'];
    message = json['message'];
  }
  String? errCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errCode'] = errCode;
    map['message'] = message;
    return map;
  }

}
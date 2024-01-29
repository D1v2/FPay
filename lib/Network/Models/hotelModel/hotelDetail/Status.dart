class Status {
  Status({
      this.success, 
      this.httpStatus,});

  Status.fromJson(dynamic json) {
    success = json['success'];
    httpStatus = json['httpStatus'];
  }
  bool? success;
  int? httpStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['httpStatus'] = httpStatus;
    return map;
  }

}
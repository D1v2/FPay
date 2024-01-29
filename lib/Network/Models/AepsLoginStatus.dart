class AepsLoginStatus {
  AepsLoginStatus({
    this.isCashWithdrawalLogin,
    this.status,
    this.code,
    this.message,
  });

  AepsLoginStatus.fromJson(dynamic json) {
    isCashWithdrawalLogin = json['IsCashWithdrawalLogin'];
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  bool? isCashWithdrawalLogin;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsCashWithdrawalLogin'] = isCashWithdrawalLogin;
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}

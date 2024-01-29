class BalanceResponse {
  bool? status;
  int? code;
  String? message;
  double? balance;

  BalanceResponse({this.status, this.code, this.message, this.balance});

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['balance'] = balance;
    return data;
  }
}
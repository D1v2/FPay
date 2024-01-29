class MAtmOnboardingResponse {
  MAtmOnboardingResponse({
      this.data, 
      this.status, 
      this.code, 
      this.message,});

  MAtmOnboardingResponse.fromJson(dynamic json) {
    data = json['data'] != null ? MAtmOnboardingData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
  MAtmOnboardingData? data;
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


class MAtmOnboardingData {
  MAtmOnboardingData({
    this.merchantcode,
    this.mobile,
    this.isNew,
    this.email,
    this.firm,
    this.callback,});

  MAtmOnboardingData.fromJson(dynamic json) {
    merchantcode = json['merchantcode'];
    mobile = json['mobile'];
    isNew = json['is_new'];
    email = json['email'];
    firm = json['firm'];
    callback = json['callback'];
  }
  String? merchantcode;
  String? mobile;
  String? isNew;
  String? email;
  String? firm;
  String? callback;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['merchantcode'] = merchantcode;
    map['mobile'] = mobile;
    map['is_new'] = isNew;
    map['email'] = email;
    map['firm'] = firm;
    map['callback'] = callback;
    return map;
  }

}
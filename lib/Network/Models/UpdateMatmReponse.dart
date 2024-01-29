class UpdateMatmReponse {
  UpdateMatmReponse({
      this.data, 
      this.status, 
      this.code, 
      this.message,});

  UpdateMatmReponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UpdateMAtmData.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }
  List<UpdateMAtmData>? data;
  bool? status;
  int? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}

class UpdateMAtmData {
  UpdateMAtmData({
    this.id,
    this.subService,
    this.subServiceId,
    this.bankRrn,
    this.referenceId,
    this.amount,
    this.status,
    this.logo,
    this.addDate,
    this.remainingBalance,
    this.memberCharge,
    this.heading,
    this.subHeading,});

  UpdateMAtmData.fromJson(dynamic json) {
    id = json['Id'];
    subService = json['SubService'];
    subServiceId = json['SubServiceId'];
    bankRrn = json['BankRrn'];
    referenceId = json['ReferenceId'];
    amount = json['Amount'];
    status = json['Status'];
    logo = json['Logo'];
    addDate = json['AddDate'];
    remainingBalance = json['RemainingBalance'];
    memberCharge = json['MemberCharge'];
    heading = json['Heading'];
    subHeading = json['SubHeading'];
  }
  int? id;
  String? subService;
  int? subServiceId;
  String? bankRrn;
  String? referenceId;
  String? amount;
  String? status;
  String? logo;
  String? addDate;
  double? remainingBalance;
  double? memberCharge;
  String? heading;
  String? subHeading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['SubService'] = subService;
    map['SubServiceId'] = subServiceId;
    map['BankRrn'] = bankRrn;
    map['ReferenceId'] = referenceId;
    map['Amount'] = amount;
    map['Status'] = status;
    map['Logo'] = logo;
    map['AddDate'] = addDate;
    map['RemainingBalance'] = remainingBalance;
    map['MemberCharge'] = memberCharge;
    map['Heading'] = heading;
    map['SubHeading'] = subHeading;
    return map;
  }

}
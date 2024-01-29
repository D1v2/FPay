class BBPSReportResponse {
  BBPSReportResponse({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  BBPSReportResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BBPSReportData.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  List<BBPSReportData>? data;
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

class BBPSReportData {
  BBPSReportData({
    this.id,
    this.memberID,
    this.memberName,
    this.memberMobile,
    this.memberFirmName,
    this.customerName,
    this.status,
    this.transID,
    this.mobileNo,
    this.caNumber,
    this.rechargeAmount,
    this.operatorName,
    this.subServiceId,
    this.serviceId,
    this.apiMessage,
    this.remainingBalance,
    this.addDate,
    this.memberCommission,
    this.operatorID,
    this.subHeading,
    this.heading,
  });

  BBPSReportData.fromJson(dynamic json) {
    id = json['Id'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberFirmName = json['MemberFirmName'];
    customerName = json['CustomerName'];
    status = json['Status'];
    transID = json['TransID'];
    mobileNo = json['MobileNo'];
    caNumber = json['caNumber'];
    rechargeAmount = json['RechargeAmount'];
    operatorName = json['OperatorName'];
    subServiceId = json['SubServiceId'];
    serviceId = json['ServiceId'];
    apiMessage = json['ApiMessage'];
    remainingBalance = json['RemainingBalance'];
    addDate = json['AddDate'];
    memberCommission = json['MemberCommission'];
    operatorID = json['OperatorID'];
    subHeading = json['SubHeading'];
    heading = json['Heading'];
  }

  int? id;
  String? memberID;
  String? memberName;
  String? memberMobile;
  String? memberFirmName;
  String? customerName;
  String? status;
  String? transID;
  String? mobileNo;
  String? caNumber;
  double? rechargeAmount;
  String? operatorName;
  int? subServiceId;
  int? serviceId;
  String? apiMessage;
  double? remainingBalance;
  String? addDate;
  double? memberCommission;
  String? operatorID;
  String? subHeading;
  String? heading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['MemberFirmName'] = memberFirmName;
    map['CustomerName'] = customerName;
    map['Status'] = status;
    map['TransID'] = transID;
    map['MobileNo'] = mobileNo;
    map['caNumber'] = caNumber;
    map['RechargeAmount'] = rechargeAmount;
    map['OperatorName'] = operatorName;
    map['SubServiceId'] = subServiceId;
    map['ServiceId'] = serviceId;
    map['ApiMessage'] = apiMessage;
    map['RemainingBalance'] = remainingBalance;
    map['AddDate'] = addDate;
    map['MemberCommission'] = memberCommission;
    map['OperatorID'] = operatorID;
    map['SubHeading'] = subHeading;
    map['Heading'] = heading;
    return map;
  }
}

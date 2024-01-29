class DoRechargeDataResponse {
  DoRechargeDataResponse({
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
    this.amount,
    this.operatorName,
    this.subServiceId,
    this.apiMessage,
    this.remainingBalance,
    this.addDate,
    this.memberCommission,
    this.operatorID,
    this.subHeading,
    this.heading,
    this.logo,
  });

  DoRechargeDataResponse.fromJson(dynamic json) {
    id = json['Id'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberFirmName = json['MemberFirmName'];
    customerName = json['CustomerName'];
    status = json['Status'];
    transID = json['TransID'];
    logo = json['Logo'];
    mobileNo = json['MobileNo'];
    caNumber = json['CaNumber'];
    amount = json['Amount'];
    operatorName = json['OperatorName'];
    subServiceId = json['SubServiceId'];
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
  double? amount;
  String? operatorName;
  int? subServiceId;
  String? apiMessage;
  dynamic remainingBalance;
  String? addDate;
  dynamic memberCommission;
  dynamic operatorID;
  String? subHeading;
  String? heading;
  String? logo;

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
    map['CaNumber'] = caNumber;
    map['Amount'] = amount;
    map['OperatorName'] = operatorName;
    map['SubServiceId'] = subServiceId;
    map['ApiMessage'] = apiMessage;
    map['RemainingBalance'] = remainingBalance;
    map['AddDate'] = addDate;
    map['MemberCommission'] = memberCommission;
    map['OperatorID'] = operatorID;
    map['SubHeading'] = subHeading;
    map['Heading'] = heading;
    map['Logo'] = logo;
    return map;
  }
}

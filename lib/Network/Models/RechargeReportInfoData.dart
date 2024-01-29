class RechargeReportInfoData {
  RechargeReportInfoData({
      this.id, 
      this.memberID, 
      this.memberName, 
      this.memberMobile, 
      this.memberFirmName, 
      this.customerName, 
      this.statusName, 
      this.logo, 
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
      this.aPITransId,
      this.heading,});

  RechargeReportInfoData.fromJson(dynamic json) {
    id = json['Id'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberFirmName = json['MemberFirmName'];
    customerName = json['CustomerName'];
    statusName = json['StatusName'];
    logo = json['Logo'];
    transID = json['TransID'];
    mobileNo = json['MobileNo'];
    caNumber = json['caNumber'];
    amount = json['Amount'];
    operatorName = json['OperatorName'];
    subServiceId = json['SubServiceId'];
    apiMessage = json['ApiMessage'];
    remainingBalance = json['RemainingBalance'];
    addDate = json['AddDate'];
    memberCommission = json['MemberCommission'];
    operatorID = json['OperatorID'];
    subHeading = json['SubHeading'];
    aPITransId = json['APITransId'];
    heading = json['Heading'];
  }
  int? id;
  String? memberID;
  String? memberName;
  String? memberMobile;
  String? memberFirmName;
  String? customerName;
  String? statusName;
  String? logo;
  String? transID;
  String? mobileNo;
  String? caNumber;
  double? amount;
  String? operatorName;
  int? subServiceId;
  dynamic apiMessage;
  dynamic remainingBalance;
  String? addDate;
  dynamic memberCommission;
  String? operatorID;
  String? subHeading;
  String? aPITransId;
  String? heading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['MemberFirmName'] = memberFirmName;
    map['CustomerName'] = customerName;
    map['StatusName'] = statusName;
    map['Logo'] = logo;
    map['TransID'] = transID;
    map['MobileNo'] = mobileNo;
    map['caNumber'] = caNumber;
    map['Amount'] = amount;
    map['OperatorName'] = operatorName;
    map['SubServiceId'] = subServiceId;
    map['ApiMessage'] = apiMessage;
    map['RemainingBalance'] = remainingBalance;
    map['AddDate'] = addDate;
    map['MemberCommission'] = memberCommission;
    map['OperatorID'] = operatorID;
    map['SubHeading'] = subHeading;
    map['APITransId'] = aPITransId;
    map['Heading'] = heading;
    return map;
  }

}
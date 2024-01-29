class ReportAepsData {
  ReportAepsData(
      {this.id,
      this.memberID,
      this.memberName,
      this.memberMobile,
      this.memberAddress,
      this.status,
      this.refId,
      this.mobileNumber,
      this.adhaarNumber,
      this.amount,
      this.requestRemarks,
      this.bankName,
      this.aPIName,
      this.apiMessage,
      this.addDate,
      this.customerRemainingBalance,
      this.remainingBalance,
      this.memberCommission,
      this.heading});

  ReportAepsData.fromJson(dynamic json) {
    id = json['Id'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberAddress = json['MemberAddress'];
    status = json['Status'];
    refId = json['RefId'];
    mobileNumber = json['MobileNumber'];
    adhaarNumber = json['AdhaarNumber'];
    amount = json['Amount'];
    requestRemarks = json['RequestRemarks'];
    bankName = json['BankName'];
    aPIName = json['APIName'];
    apiMessage = json['ApiMessage'];
    addDate = json['AddDate'];
    customerRemainingBalance = json['CustomerRemainingBalance'];
    remainingBalance = json['RemainingBalance'];
    memberCommission = json['MemberCommission'];
    heading = json['Heading'];
  }

  int? id;
  String? memberID;
  String? memberName;
  String? memberMobile;
  String? memberAddress;
  String? status;
  String? refId;
  String? mobileNumber;
  String? adhaarNumber;
  double? amount;
  String? requestRemarks;
  String? bankName;
  String? aPIName;
  String? apiMessage;
  String? addDate;
  num? customerRemainingBalance;
  dynamic? remainingBalance;
  dynamic? memberCommission;
  String? heading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['MemberAddress'] = memberAddress;
    map['Status'] = status;
    map['RefId'] = refId;
    map['MobileNumber'] = mobileNumber;
    map['AdhaarNumber'] = adhaarNumber;
    map['Amount'] = amount;
    map['RequestRemarks'] = requestRemarks;
    map['BankName'] = bankName;
    map['APIName'] = aPIName;
    map['ApiMessage'] = apiMessage;
    map['AddDate'] = addDate;
    map['CustomerRemainingBalance'] = customerRemainingBalance;
    map['RemainingBalance'] = remainingBalance;
    map['MemberCommission'] = memberCommission;
    map['Heading'] = heading;
    return map;
  }
}

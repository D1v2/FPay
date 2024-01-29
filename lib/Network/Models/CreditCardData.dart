class CreditCardData {
  CreditCardData({
    this.refId,
    this.mobile,
    this.cardNumber,
    this.network,
    this.name,
    this.amount,
    this.remarks,
    this.bankrrn,
    this.ackno,
    this.apiStatus,
    this.apiResponseCode,
    this.apiMessage,
    this.addDate,
    this.status,
    this.memberName,
    this.memberID,
    this.memberMobile,
    this.memberAddress,
    this.memberFirmName,
    this.remainingBalance,
    this.heading,
    this.subheading,
    this.memberCharge,
  });

  CreditCardData.fromJson(dynamic json) {
    refId = json['RefId'];
    mobile = json['Mobile'];
    cardNumber = json['CardNumber'];
    network = json['Network'];
    name = json['Name'];
    amount = json['Amount'];
    remarks = json['Remarks'];
    bankrrn = json['Bankrrn'];
    ackno = json['Ackno'];
    apiStatus = json['ApiStatus'];
    apiResponseCode = json['ApiResponse_Code'];
    apiMessage = json['ApiMessage'];
    addDate = json['AddDate'];
    status = json['Status'];
    memberName = json['MemberName'];
    memberID = json['MemberID'];
    memberMobile = json['MemberMobile'];
    memberAddress = json['MemberAddress'];
    memberFirmName = json['MemberFirmName'];
    remainingBalance = json['RemainingBalance'];
    heading = json['Heading'];
    subheading = json['Subheading'];
    memberCharge = json['MemberCharge'];
  }

  String? refId;
  String? mobile;
  String? cardNumber;
  String? network;
  String? name;
  double? amount;
  String? remarks;
  dynamic bankrrn;
  String? ackno;
  String? apiStatus;
  String? apiResponseCode;
  String? apiMessage;
  String? addDate;
  String? status;
  String? memberName;
  String? memberID;
  String? memberMobile;
  String? memberAddress;
  String? memberFirmName;
  double? remainingBalance;
  String? heading;
  String? subheading;
  double? memberCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['RefId'] = refId;
    map['Mobile'] = mobile;
    map['CardNumber'] = cardNumber;
    map['Network'] = network;
    map['Name'] = name;
    map['Amount'] = amount;
    map['Remarks'] = remarks;
    map['Bankrrn'] = bankrrn;
    map['Ackno'] = ackno;
    map['ApiStatus'] = apiStatus;
    map['ApiResponse_Code'] = apiResponseCode;
    map['ApiMessage'] = apiMessage;
    map['AddDate'] = addDate;
    map['Status'] = status;
    map['MemberName'] = memberName;
    map['MemberID'] = memberID;
    map['MemberMobile'] = memberMobile;
    map['MemberAddress'] = memberAddress;
    map['MemberFirmName'] = memberFirmName;
    map['RemainingBalance'] = remainingBalance;
    map['Heading'] = heading;
    map['Subheading'] = subheading;
    map['MemberCharge'] = memberCharge;
    return map;
  }
}

class PayoutReportData {
  PayoutReportData({
    this.memberID,
    this.memberName,
    this.memberMobile,
    this.memberFirmName,
    this.memberAddress,
    this.bankName,
    this.status,
    this.id,
    this.msrNo,
    this.subService,
    this.subServiceId,
    this.number,
    this.referenceId,
    this.bankrrn,
    this.amount,
    this.logo,
    this.remainingBalance,
    this.memberCommission,
    this.memberCharge,
    this.apiTxnId,
    this.heading,
    this.addDate,
    this.isActive,
    this.isDelete,
    this.accountHolderName
  });

  PayoutReportData.fromJson(dynamic json) {
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberFirmName = json['MemberFirmName'];
    memberAddress = json['MemberAddress'];
    bankName = json['BankName'];
    status = json['Status'];
    id = json['Id'];
    msrNo = json['MsrNo'];
    subService = json['SubService'];
    subServiceId = json['SubServiceId'];
    number = json['Number'];
    referenceId = json['ReferenceId'];
    bankrrn = json['Bankrrn'];
    amount = json['Amount'];
    logo = json['Logo'];
    remainingBalance = json['RemainingBalance'];
    memberCommission = json['MemberCommission'];
    memberCharge = json['MemberCharge'];
    apiTxnId = json['ApiTxnId'];
    heading = json['Heading'];
    addDate = json['AddDate'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    accountHolderName = json['AccountHolderName'];
  }

  String? memberID;
  String? memberName;
  String? memberMobile;
  String? memberFirmName;
  String? memberAddress;
  dynamic? bankName;
  String? status;
  int? id;
  int? msrNo;
  String? subService;
  int? subServiceId;
  String? number;
  String? referenceId;
  String? bankrrn;
  double? amount;
  String? logo;
  dynamic? remainingBalance;
  dynamic? memberCommission;
  dynamic? memberCharge;
  String? apiTxnId;
  String? heading;
  String? addDate;
  bool? isActive;
  bool? isDelete;
  String? accountHolderName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['MemberFirmName'] = memberFirmName;
    map['MemberAddress'] = memberAddress;
    map['BankName'] = bankName;
    map['Status'] = status;
    map['Id'] = id;
    map['MsrNo'] = msrNo;
    map['SubService'] = subService;
    map['SubServiceId'] = subServiceId;
    map['Number'] = number;
    map['Bankrrn'] = bankrrn;
    map['ReferenceId'] = referenceId;
    map['Amount'] = amount;
    map['Logo'] = logo;
    map['RemainingBalance'] = remainingBalance;
    map['MemberCommission'] = memberCommission;
    map['MemberCharge'] = memberCharge;
    map['ApiTxnId'] = apiTxnId;
    map['Heading'] = heading;
    map['AddDate'] = addDate;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    map['AccountHolderName'] = accountHolderName;
    return map;
  }
}

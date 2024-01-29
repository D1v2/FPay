class MoneyTransferReportData {
  MoneyTransferReportData({
      this.id, 
      this.memberID, 
      this.memberName, 
      this.memberMobile, 
      this.memberFirmName, 
      this.memberAddress, 
      this.status, 
      this.transferId, 
      this.accountNumber, 
      this.amount, 
      this.apiMessage, 
      this.addDate, 
      this.bankName, 
      this.remainingBalance, 
      this.memberCommission, 
      this.memberCharge, 
      this.uTRNo, 
      this.remitterNumber, 
      this.transactionId, 
      this.heading, 
      this.beneficiaryName,});

  MoneyTransferReportData.fromJson(dynamic json) {
    id = json['Id'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    memberFirmName = json['MemberFirmName'];
    memberAddress = json['MemberAddress'];
    status = json['Status'];
    transferId = json['TransferId'];
    accountNumber = json['AccountNumber'];
    amount = json['Amount'];
    apiMessage = json['ApiMessage'];
    addDate = json['AddDate'];
    bankName = json['BankName'];
    remainingBalance = json['RemainingBalance'];
    memberCommission = json['MemberCommission'];
    memberCharge = json['MemberCharge'];
    uTRNo = json['UTRNo'];
    remitterNumber = json['RemitterNumber'];
    transactionId = json['TransactionId'];
    heading = json['Heading'];
    beneficiaryName = json['BeneficiaryName'];
  }
  int? id;
  String? memberID;
  String? memberName;
  String? memberMobile;
  String? memberFirmName;
  String? memberAddress;
  String? status;
  String? transferId;
  String? accountNumber;
  double? amount;
  String? apiMessage;
  String? addDate;
  String? bankName;
  double? remainingBalance;
  double? memberCommission;
  double? memberCharge;
  String? uTRNo;
  String? remitterNumber;
  String? transactionId;
  String? heading;
  String? beneficiaryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['MemberFirmName'] = memberFirmName;
    map['MemberAddress'] = memberAddress;
    map['Status'] = status;
    map['TransferId'] = transferId;
    map['AccountNumber'] = accountNumber;
    map['Amount'] = amount;
    map['ApiMessage'] = apiMessage;
    map['AddDate'] = addDate;
    map['BankName'] = bankName;
    map['RemainingBalance'] = remainingBalance;
    map['MemberCommission'] = memberCommission;
    map['MemberCharge'] = memberCharge;
    map['UTRNo'] = uTRNo;
    map['RemitterNumber'] = remitterNumber;
    map['TransactionId'] = transactionId;
    map['Heading'] = heading;
    map['BeneficiaryName'] = beneficiaryName;
    return map;
  }

}
class SelfBankData {
  SelfBankData({
      this.id, 
      this.msrNo, 
      this.bankId, 
      this.accountNumber, 
      this.holderName, 
      this.branch, 
      this.accountType, 
      this.ifsc, 
      this.ipAddress, 
      this.addDate, 
      this.lastUpdate, 
      this.isActive, 
      this.isDelete, 
      this.isApprove, 
      this.memberID, 
      this.memberName, 
      this.memberMobile, 
      this.firmName, 
      this.bankName, 
      this.aepsBalance, 
      this.transferAmount, 
      this.operatorId, 
      this.bankAutoId, 
      this.fromDate, 
      this.toDate, 
      this.actionId, 
      this.transactionSource, 
      this.listMemberBankDD, 
      this.listPayoutTransferModeDD, 
      this.listMemberBank,});

  SelfBankData.fromJson(dynamic json) {
    id = json['ID'];
    msrNo = json['MsrNo'];
    bankId = json['BankId'];
    accountNumber = json['AccountNumber'];
    holderName = json['HolderName'];
    branch = json['Branch'];
    accountType = json['AccountType'];
    ifsc = json['IFSC'];
    ipAddress = json['IpAddress'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    isApprove = json['IsApprove'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    memberMobile = json['MemberMobile'];
    firmName = json['FirmName'];
    bankName = json['BankName'];
    aepsBalance = json['AepsBalance'];
    transferAmount = json['TransferAmount'];
    operatorId = json['OperatorId'];
    bankAutoId = json['BankAutoId'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    actionId = json['ActionId'];
    transactionSource = json['TransactionSource'];
    listMemberBankDD = json['ListMemberBankDD'];
    listPayoutTransferModeDD = json['ListPayoutTransferModeDD'];
    listMemberBank = json['ListMemberBank'];
  }
  int? id;
  int? msrNo;
  int? bankId;
  String? accountNumber;
  String? holderName;
  String? branch;
  String? accountType;
  String? ifsc;
  dynamic? ipAddress;
  String? addDate;
  dynamic? lastUpdate;
  bool? isActive;
  bool? isDelete;
  int? isApprove;
  dynamic memberID;
  dynamic memberName;
  dynamic memberMobile;
  dynamic firmName;
  String? bankName;
  String? aepsBalance;
  dynamic transferAmount;
  int? operatorId;
  int? bankAutoId;
  dynamic fromDate;
  dynamic toDate;
  int? actionId;
  dynamic transactionSource;
  dynamic listMemberBankDD;
  dynamic listPayoutTransferModeDD;
  dynamic listMemberBank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['MsrNo'] = msrNo;
    map['BankId'] = bankId;
    map['AccountNumber'] = accountNumber;
    map['HolderName'] = holderName;
    map['Branch'] = branch;
    map['AccountType'] = accountType;
    map['IFSC'] = ifsc;
    map['IpAddress'] = ipAddress;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    map['IsApprove'] = isApprove;
    map['MemberID'] = memberID;
    map['MemberName'] = memberName;
    map['MemberMobile'] = memberMobile;
    map['FirmName'] = firmName;
    map['BankName'] = bankName;
    map['AepsBalance'] = aepsBalance;
    map['TransferAmount'] = transferAmount;
    map['OperatorId'] = operatorId;
    map['BankAutoId'] = bankAutoId;
    map['FromDate'] = fromDate;
    map['ToDate'] = toDate;
    map['ActionId'] = actionId;
    map['TransactionSource'] = transactionSource;
    map['ListMemberBankDD'] = listMemberBankDD;
    map['ListPayoutTransferModeDD'] = listPayoutTransferModeDD;
    map['ListMemberBank'] = listMemberBank;
    return map;
  }

}
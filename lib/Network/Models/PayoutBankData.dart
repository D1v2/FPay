class PayoutBankData {
  PayoutBankData({
      this.id, 
      this.msrNo, 
      this.mobile, 
      this.beneficiaryName, 
      this.bankId, 
      this.bankName, 
      this.accountNo, 
      this.ifsc, 
      this.accountType, 
      this.verified, 
      this.status, 
      this.apiStatus, 
      this.apiResponseCode, 
      this.apiMessage, 
      this.isActive, 
      this.isDelete, 
      this.addDate, 
      this.lastUpdate,});

  PayoutBankData.fromJson(dynamic json) {
    id = json['ID'];
    msrNo = json['MsrNo'];
    mobile = json['Mobile'];
    beneficiaryName = json['BeneficiaryName'];
    bankId = json['BankId'];
    bankName = json['BankName'];
    accountNo = json['AccountNo'];
    ifsc = json['Ifsc'];
    accountType = json['AccountType'];
    verified = json['Verified'];
    status = json['Status'];
    apiStatus = json['ApiStatus'];
    apiResponseCode = json['ApiResponse_Code'];
    apiMessage = json['ApiMessage'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
  }
  int? id;
  int? msrNo;
  dynamic? mobile;
  String? beneficiaryName;
  int? bankId;
  String? bankName;
  String? accountNo;
  String? ifsc;
  dynamic? accountType;
  int? verified;
  int? status;
  dynamic? apiStatus;
  dynamic? apiResponseCode;
  dynamic? apiMessage;
  bool? isActive;
  bool? isDelete;
  dynamic? addDate;
  dynamic? lastUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['MsrNo'] = msrNo;
    map['Mobile'] = mobile;
    map['BeneficiaryName'] = beneficiaryName;
    map['BankId'] = bankId;
    map['BankName'] = bankName;
    map['AccountNo'] = accountNo;
    map['Ifsc'] = ifsc;
    map['AccountType'] = accountType;
    map['Verified'] = verified;
    map['Status'] = status;
    map['ApiStatus'] = apiStatus;
    map['ApiResponse_Code'] = apiResponseCode;
    map['ApiMessage'] = apiMessage;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    return map;
  }

}
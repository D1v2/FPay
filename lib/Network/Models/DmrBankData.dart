class DmrBankData {
  DmrBankData({
      this.id, 
      this.msrNo, 
      this.mobile, 
      this.beneficiaryName, 
      this.bankId, 
      this.bankName, 
      this.accountNo, 
      this.ifsc, 
      this.transactionMode, 
      this.amount, 
      this.beneficiaryID, 
      this.otp, 
      this.otpReference, 
      this.apiTxnId, 
      this.transactionSource, 
      this.verified, 
      this.verifiedName, 
      this.verifiedDate, 
      this.txnAmount, 
      this.splitTxnAmount, 
      this.chargeAmount, 
      this.totalAmount, 
      this.status, 
      this.apiStatus, 
      this.apiResponseCode, 
      this.apiMessage, 
      this.isDelete, 
      this.isActive, 
      this.addDate, 
      this.lastUpdate, 
      this.listBeneficiaryDetails, 
      this.listDmtHistory, 
      this.listBankDD,});

  DmrBankData.fromJson(dynamic json) {
    id = json['ID'];
    msrNo = json['MsrNo'];
    mobile = json['Mobile'];
    beneficiaryName = json['BeneficiaryName'];
    bankId = json['BankId'];
    bankName = json['BankName'];
    accountNo = json['AccountNo'];
    ifsc = json['Ifsc'];
    transactionMode = json['TransactionMode'];
    amount = json['Amount'];
    beneficiaryID = json['BeneficiaryID'];
    otp = json['OTP'];
    otpReference = json['OtpReference'];
    apiTxnId = json['ApiTxnId'];
    transactionSource = json['TransactionSource'];
    verified = json['Verified'];
    verifiedName = json['VerifiedName'];
    verifiedDate = json['VerifiedDate'];
    txnAmount = json['TxnAmount'];
    splitTxnAmount = json['SplitTxnAmount'];
    chargeAmount = json['ChargeAmount'];
    totalAmount = json['TotalAmount'];
    status = json['Status'];
    apiStatus = json['ApiStatus'];
    apiResponseCode = json['ApiResponse_Code'];
    apiMessage = json['ApiMessage'];
    isDelete = json['IsDelete'];
    isActive = json['IsActive'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    listBeneficiaryDetails = json['ListBeneficiaryDetails'];
    listDmtHistory = json['ListDmtHistory'];
    listBankDD = json['ListBankDD'];
  }
  int? id;
  int? msrNo;
  String? mobile;
  String? beneficiaryName;
  int? bankId;
  String? bankName;
  String? accountNo;
  String? ifsc;
  dynamic? transactionMode;
  double? amount;
  String? beneficiaryID;
  dynamic? otp;
  dynamic? otpReference;
  dynamic? apiTxnId;
  dynamic? transactionSource;
  int? verified;
  dynamic? verifiedName;
  String? verifiedDate;
  double? txnAmount;
  double? splitTxnAmount;
  double? chargeAmount;
  double? totalAmount;
  int? status;
  int? apiStatus;
  dynamic? apiResponseCode;
  dynamic? apiMessage;
  bool? isDelete;
  bool? isActive;
  dynamic? addDate;
  dynamic? lastUpdate;
  dynamic? listBeneficiaryDetails;
  dynamic? listDmtHistory;
  dynamic? listBankDD;

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
    map['TransactionMode'] = transactionMode;
    map['Amount'] = amount;
    map['BeneficiaryID'] = beneficiaryID;
    map['OTP'] = otp;
    map['OtpReference'] = otpReference;
    map['ApiTxnId'] = apiTxnId;
    map['TransactionSource'] = transactionSource;
    map['Verified'] = verified;
    map['VerifiedName'] = verifiedName;
    map['VerifiedDate'] = verifiedDate;
    map['TxnAmount'] = txnAmount;
    map['SplitTxnAmount'] = splitTxnAmount;
    map['ChargeAmount'] = chargeAmount;
    map['TotalAmount'] = totalAmount;
    map['Status'] = status;
    map['ApiStatus'] = apiStatus;
    map['ApiResponse_Code'] = apiResponseCode;
    map['ApiMessage'] = apiMessage;
    map['IsDelete'] = isDelete;
    map['IsActive'] = isActive;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    map['ListBeneficiaryDetails'] = listBeneficiaryDetails;
    map['ListDmtHistory'] = listDmtHistory;
    map['ListBankDD'] = listBankDD;
    return map;
  }

}
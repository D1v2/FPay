class QrCodeData {
  QrCodeData({
      this.id, 
      this.uniId, 
      this.msrNo, 
      this.upiHolderName, 
      this.upiBank, 
      this.upi, 
      this.qrCode, 
      this.accountBank, 
      this.accountNumber, 
      this.holderName, 
      this.ifsc, 
      this.branch, 
      this.accountType, 
      this.apiStatus, 
      this.apiMessage, 
      this.isActive, 
      this.isDelete, 
      this.addDate, 
      this.lastUpdate, 
      this.memberTypeId,});

  QrCodeData.fromJson(dynamic json) {
    id = json['Id'];
    uniId = json['UniId'];
    msrNo = json['MsrNo'];
    upiHolderName = json['UpiHolderName'];
    upiBank = json['UpiBank'];
    upi = json['Upi'];
    qrCode = json['QrCode'];
    accountBank = json['AccountBank'];
    accountNumber = json['AccountNumber'];
    holderName = json['HolderName'];
    ifsc = json['Ifsc'];
    branch = json['Branch'];
    accountType = json['AccountType'];
    apiStatus = json['ApiStatus'];
    apiMessage = json['ApiMessage'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    memberTypeId = json['MemberTypeId'];
  }
  int? id;
  String? uniId;
  int? msrNo;
  String? upiHolderName;
  String? upiBank;
  String? upi;
  String? qrCode;
  dynamic accountBank;
  dynamic accountNumber;
  dynamic holderName;
  dynamic ifsc;
  dynamic branch;
  dynamic accountType;
  String? apiStatus;
  String? apiMessage;
  bool? isActive;
  bool? isDelete;
  String? addDate;
  String? lastUpdate;
  int? memberTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['UniId'] = uniId;
    map['MsrNo'] = msrNo;
    map['UpiHolderName'] = upiHolderName;
    map['UpiBank'] = upiBank;
    map['Upi'] = upi;
    map['QrCode'] = qrCode;
    map['AccountBank'] = accountBank;
    map['AccountNumber'] = accountNumber;
    map['HolderName'] = holderName;
    map['Ifsc'] = ifsc;
    map['Branch'] = branch;
    map['AccountType'] = accountType;
    map['ApiStatus'] = apiStatus;
    map['ApiMessage'] = apiMessage;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    map['MemberTypeId'] = memberTypeId;
    return map;
  }

}
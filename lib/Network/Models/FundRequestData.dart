class FundRequestData {
  FundRequestData({
      this.action, 
      this.id, 
      this.msrNo, 
      this.introMsrNo, 
      this.approvedBy, 
      this.amount, 
      this.paymentModeID, 
      this.refno, 
      this.requestDate, 
      this.requestRemark, 
      this.fromBank, 
      this.toBank, 
      this.statusId, 
      this.responseDate, 
      this.responseRemark, 
      this.chequeOrDDNumber, 
      this.chequeDate, 
      this.attachment, 
      this.attachmentName, 
      this.transactionSource, 
      this.addDate, 
      this.lastUpdate, 
      this.isActive, 
      this.isDelete, 
      this.tPass, 
      this.fromBankName, 
      this.toBankName, 
      this.paymentMode, 
      this.memberName, 
      this.memberID, 
      this.memberMobile, 
      this.status, 
      this.fromDate, 
      this.toDate, 
      this.listFundRequest, 
      this.paymentModeDD, 
      this.fundRequestStatusDD, 
      this.bankDD,});

  FundRequestData.fromJson(dynamic json) {
    action = json['Action'];
    id = json['ID'];
    msrNo = json['MsrNo'];
    introMsrNo = json['IntroMsrNo'];
    approvedBy = json['ApprovedBy'];
    amount = json['Amount'];
    paymentModeID = json['PaymentModeID'];
    refno = json['Refno'];
    requestDate = json['RequestDate'];
    requestRemark = json['RequestRemark'];
    fromBank = json['FromBank'];
    toBank = json['ToBank'];
    statusId = json['StatusId'];
    responseDate = json['ResponseDate'];
    responseRemark = json['ResponseRemark'];
    chequeOrDDNumber = json['ChequeOrDDNumber'];
    chequeDate = json['ChequeDate'];
    attachment = json['Attachment'];
    attachmentName = json['AttachmentName'];
    transactionSource = json['TransactionSource'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    tPass = json['TPass'];
    fromBankName = json['FromBankName'];
    toBankName = json['ToBankName'];
    paymentMode = json['PaymentMode'];
    memberName = json['MemberName'];
    memberID = json['MemberID'];
    memberMobile = json['MemberMobile'];
    status = json['Status'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    listFundRequest = json['ListFundRequest'];
    paymentModeDD = json['PaymentModeDD'];
    fundRequestStatusDD = json['FundRequestStatusDD'];
    bankDD = json['BankDD'];
  }
  dynamic? action;
  int? id;
  int? msrNo;
  int? introMsrNo;
  int? approvedBy;
  double? amount;
  int? paymentModeID;
  dynamic? refno;
  String? requestDate;
  dynamic? requestRemark;
  int? fromBank;
  int? toBank;
  int? statusId;
  String? responseDate;
  dynamic? responseRemark;
  dynamic? chequeOrDDNumber;
  dynamic? chequeDate;
  dynamic? attachment;
  dynamic? attachmentName;
  String? transactionSource;
  String? addDate;
  String? lastUpdate;
  bool? isActive;
  bool? isDelete;
  dynamic? tPass;
  dynamic? fromBankName;
  dynamic? toBankName;
  String? paymentMode;
  String? memberName;
  String? memberID;
  String? memberMobile;
  String? status;
  dynamic fromDate;
  dynamic toDate;
  dynamic listFundRequest;
  dynamic paymentModeDD;
  dynamic fundRequestStatusDD;
  dynamic bankDD;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Action'] = action;
    map['ID'] = id;
    map['MsrNo'] = msrNo;
    map['IntroMsrNo'] = introMsrNo;
    map['ApprovedBy'] = approvedBy;
    map['Amount'] = amount;
    map['PaymentModeID'] = paymentModeID;
    map['Refno'] = refno;
    map['RequestDate'] = requestDate;
    map['RequestRemark'] = requestRemark;
    map['FromBank'] = fromBank;
    map['ToBank'] = toBank;
    map['StatusId'] = statusId;
    map['ResponseDate'] = responseDate;
    map['ResponseRemark'] = responseRemark;
    map['ChequeOrDDNumber'] = chequeOrDDNumber;
    map['ChequeDate'] = chequeDate;
    map['Attachment'] = attachment;
    map['AttachmentName'] = attachmentName;
    map['TransactionSource'] = transactionSource;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    map['TPass'] = tPass;
    map['FromBankName'] = fromBankName;
    map['ToBankName'] = toBankName;
    map['PaymentMode'] = paymentMode;
    map['MemberName'] = memberName;
    map['MemberID'] = memberID;
    map['MemberMobile'] = memberMobile;
    map['Status'] = status;
    map['FromDate'] = fromDate;
    map['ToDate'] = toDate;
    map['ListFundRequest'] = listFundRequest;
    map['PaymentModeDD'] = paymentModeDD;
    map['FundRequestStatusDD'] = fundRequestStatusDD;
    map['BankDD'] = bankDD;
    return map;
  }

}
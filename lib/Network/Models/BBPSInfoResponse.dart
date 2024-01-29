class BBPSInfoResponse {
  bool? status;
  int? code;
  String? message;
  BBPSInfoData? data;

  BBPSInfoResponse({this.status, this.code, this.message, this.data});

  BBPSInfoResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? BBPSInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BBPSInfoData {
  int? subServiceID;
  int? operatorID;
  String? caNumber;
  String? mobileNo;
  Null? email;
  String? operatorCode;
  String? operatorName;
  String? billUnit;
  String? customerName;
  String? billAmount;
  String? billDueDate;
  String? billdate;
  String? fetchBillId;
  String? apiStatus;
  String? aPIMessage;
  String? licvalidationId;
  String? licbillId;
  String? licbillNumber;

  BBPSInfoData(
      {this.subServiceID,
      this.operatorID,
      this.caNumber,
      this.mobileNo,
      this.email,
      this.operatorCode,
      this.operatorName,
      this.billUnit,
      this.customerName,
      this.billAmount,
      this.billDueDate,
      this.billdate,
      this.fetchBillId,
      this.apiStatus,
      this.aPIMessage,
      this.licvalidationId,
      this.licbillId,
      this.licbillNumber});

  BBPSInfoData.fromJson(Map<String, dynamic> json) {
    subServiceID = json['SubServiceID'];
    operatorID = json['OperatorID'];
    caNumber = json['CaNumber'];
    mobileNo = json['MobileNo'];
    email = json['Email'];
    operatorCode = json['OperatorCode'];
    operatorName = json['OperatorName'];
    billUnit = json['BillUnit'];
    customerName = json['CustomerName'];
    billAmount = json['BillAmount'];
    billDueDate = json['BillDueDate'];
    billdate = json['Billdate'];
    fetchBillId = json['FetchBillId'];
    apiStatus = json['ApiStatus'];
    aPIMessage = json['APIMessage'];
    licvalidationId = json['LicvalidationId'];
    licbillId = json['LicbillId'];
    licbillNumber = json['LicbillNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SubServiceID'] = subServiceID;
    data['OperatorID'] = operatorID;
    data['CaNumber'] = caNumber;
    data['MobileNo'] = mobileNo;
    data['Email'] = email;
    data['OperatorCode'] = operatorCode;
    data['OperatorName'] = operatorName;
    data['BillUnit'] = billUnit;
    data['CustomerName'] = customerName;
    data['BillAmount'] = billAmount;
    data['BillDueDate'] = billDueDate;
    data['Billdate'] = billdate;
    data['FetchBillId'] = fetchBillId;
    data['ApiStatus'] = apiStatus;
    data['APIMessage'] = aPIMessage;
    data['LicvalidationId'] = licvalidationId;
    data['LicbillId'] = licbillId;
    data['LicbillNumber'] = licbillNumber;
    return data;
  }
}

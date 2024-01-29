class ReportData {
  ReportData({
      this.rowNumber, 
      this.id, 
      this.msrNo, 
      this.subService, 
      this.subServiceID, 
      this.number, 
      this.referenceID, 
      this.amount, 
      this.status, 
      this.logo, 
      this.heading, 
      this.subheading, 
      this.addDate, 
      this.isActive, 
      this.isDelete,});

  ReportData.fromJson(dynamic json) {
    rowNumber = json['RowNumber'];
    id = json['Id'];
    msrNo = json['MsrNo'];
    subService = json['SubService'];
    subServiceID = json['SubServiceID'];
    number = json['Number'];
    referenceID = json['ReferenceID'];
    amount = json['Amount'];
    status = json['Status'];
    logo = json['Logo'];
    heading = json['Heading'];
    subheading = json['Subheading'];
    addDate = json['AddDate'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
  }
  int? rowNumber;
  int? id;
  int? msrNo;
  String? subService;
  int? subServiceID;
  String? number;
  String? referenceID;
  double? amount;
  String? status;
  String? logo;
  String? heading;
  String? subheading;
  String? addDate;
  int? isActive;
  int? isDelete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['RowNumber'] = rowNumber;
    map['Id'] = id;
    map['MsrNo'] = msrNo;
    map['SubService'] = subService;
    map['SubServiceID'] = subServiceID;
    map['Number'] = number;
    map['ReferenceID'] = referenceID;
    map['Amount'] = amount;
    map['Status'] = status;
    map['Logo'] = logo;
    map['Heading'] = heading;
    map['Subheading'] = subheading;
    map['AddDate'] = addDate;
    map['IsActive'] = isActive;
    map['IsDelete'] = isDelete;
    return map;
  }

}
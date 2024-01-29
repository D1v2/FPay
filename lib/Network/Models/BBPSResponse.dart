class BBPSResponse {
  bool? status;
  int? code;
  String? message;
  List<BBPSData>? data;

  BBPSResponse({this.status, this.code, this.message, this.data});

  BBPSResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BBPSData>[];
      json['data'].forEach((v) {
        data!.add(BBPSData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BBPSData {
  int? operatorID;
  String? operatorName;
  String? operatorCode;
  int? serviceID;
  String? operatorLOGO;
  Null? position;
  String? displayName;
  int? subServiceID;
  String? displayName1;
  String? name1;
  String? regex1;
  String? displayName2;
  String? name2;
  String? regex2;
  String? displayName3;
  String? name3;
  String? regex3;
  String? displayName4;
  String? name4;
  String? regex4;
  String? displayName5;
  String? name5;
  String? regex5;
  String? serviceName;
  bool? isFetch;
  bool? isPartialPay;

  BBPSData({
    this.operatorID,
    this.operatorName,
    this.operatorCode,
    this.serviceID,
    this.operatorLOGO,
    this.position,
    this.displayName,
    this.subServiceID,
    this.displayName1,
    this.name1,
    this.regex1,
    this.displayName2,
    this.name2,
    this.regex2,
    this.displayName3,
    this.name3,
    this.regex3,
    this.displayName4,
    this.name4,
    this.regex4,
    this.displayName5,
    this.name5,
    this.regex5,
    this.serviceName,
    this.isFetch,
    this.isPartialPay
  });

  BBPSData.fromJson(Map<String, dynamic> json) {
    operatorID = json['OperatorID'];
    operatorName = json['OperatorName'];
    operatorCode = json['OperatorCode'];
    serviceID = json['ServiceID'];
    operatorLOGO = json['OperatorLOGO'];
    position = json['Position'];
    displayName = json['DisplayName'];
    subServiceID = json['SubServiceID'];
    displayName1 = json['DisplayName1'];
    name1 = json['Name1'];
    regex1 = json['Regex1'];
    displayName2 = json['DisplayName2'];
    name2 = json['Name2'];
    regex2 = json['Regex2'];
    displayName3 = json['DisplayName3'];
    name3 = json['Name3'];
    regex3 = json['Regex3'];
    displayName4 = json['DisplayName4'];
    name4 = json['Name4'];
    regex4 = json['Regex4'];
    displayName5 = json['DisplayName5'];
    name5 = json['Name5'];
    regex5 = json['Regex5'];
    serviceName = json['ServiceName'];
    isFetch = json['IsFetch'];
    isPartialPay = json['IsPartialPay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OperatorID'] = operatorID;
    data['OperatorName'] = operatorName;
    data['OperatorCode'] = operatorCode;
    data['ServiceID'] = serviceID;
    data['OperatorLOGO'] = operatorLOGO;
    data['Position'] = position;
    data['DisplayName'] = displayName;
    data['SubServiceID'] = subServiceID;
    data['DisplayName1'] = displayName1;
    data['Name1'] = name1;
    data['Regex1'] = regex1;
    data['DisplayName2'] = displayName2;
    data['Name2'] = name2;
    data['Regex2'] = regex2;
    data['DisplayName3'] = displayName3;
    data['Name3'] = name3;
    data['Regex3'] = regex3;
    data['DisplayName4'] = displayName4;
    data['Name4'] = name4;
    data['Regex4'] = regex4;
    data['DisplayName5'] = displayName5;
    data['Name5'] = name5;
    data['Regex5'] = regex5;
    data['ServiceName'] = serviceName;
    data['IsFetch'] = isFetch;
    data['IsPartialPay'] = isPartialPay;
    return data;
  }
}

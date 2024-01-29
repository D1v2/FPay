class BankResponse {
  bool? status;
  int? code;
  String? message;
  List<BankData>? data;

  BankResponse({this.status, this.code, this.message, this.data});

  BankResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BankData>[];
      json['data'].forEach((v) {
        data!.add(BankData.fromJson(v));
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

class BankData {
  int? iD;
  String? bankName;
  int? bankID;
  String? ifscAlias;
  String? ifscGlobal;
  int? neftEnabled;
  int? neftFailureRate;
  int? impsEnabled;
  int? impsFailureRate;
  int? upiEnabled;
  int? upiFailureRate;

  BankData(
      {this.iD,
      this.bankName,
      this.bankID,
      this.ifscAlias,
      this.ifscGlobal,
      this.neftEnabled,
      this.neftFailureRate,
      this.impsEnabled,
      this.impsFailureRate,
      this.upiEnabled,
      this.upiFailureRate});

  BankData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bankName = json['BankName'];
    bankID = json['BankID'];
    ifscAlias = json['IfscAlias'];
    ifscGlobal = json['IfscGlobal'];
    neftEnabled = json['NeftEnabled'];
    neftFailureRate = json['NeftFailureRate'];
    impsEnabled = json['ImpsEnabled'];
    impsFailureRate = json['ImpsFailureRate'];
    upiEnabled = json['UpiEnabled'];
    upiFailureRate = json['UpiFailureRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['BankName'] = bankName;
    data['BankID'] = bankID;
    data['IfscAlias'] = ifscAlias;
    data['IfscGlobal'] = ifscGlobal;
    data['NeftEnabled'] = neftEnabled;
    data['NeftFailureRate'] = neftFailureRate;
    data['ImpsEnabled'] = impsEnabled;
    data['ImpsFailureRate'] = impsFailureRate;
    data['UpiEnabled'] = upiEnabled;
    data['UpiFailureRate'] = upiFailureRate;
    return data;
  }
}

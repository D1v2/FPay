class OperatorData {
  OperatorData(
      {this.id, this.operatorName, this.serviceName, this.operatorLogo});

  OperatorData.fromJson(dynamic json) {
    id = json['ID'];
    operatorName = json['OperatorName'];
    serviceName = json['ServiceName'];
    operatorLogo = json['OperatorLOGO'];
  }

  int? id;
  String? operatorName;
  String? serviceName;
  String? operatorLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['OperatorName'] = operatorName;
    map['ServiceName'] = serviceName;
    map['OperatorLOGO'] = operatorLogo;
    return map;
  }
}

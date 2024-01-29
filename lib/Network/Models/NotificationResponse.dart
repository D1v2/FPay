class NotificationResponse {
  bool? status;
  int? code;
  String? message;
  List<NotificationData>? data;

  NotificationResponse({this.status, this.code, this.message, this.data});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(NotificationData.fromJson(v));
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

class NotificationData {
  int? iD;
  String? name;
  String? description;
  int? memberTypeId;
  String? platform;
  int? isActive;
  bool? isDelete;
  String? addDate;
  Null? lastUpdate;

  NotificationData(
      {this.iD,
      this.name,
      this.description,
      this.memberTypeId,
      this.platform,
      this.isActive,
      this.isDelete,
      this.addDate,
      this.lastUpdate});

  NotificationData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
    memberTypeId = json['MemberTypeId'];
    platform = json['Platform'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    data['Description'] = description;
    data['MemberTypeId'] = memberTypeId;
    data['Platform'] = platform;
    data['IsActive'] = isActive;
    data['IsDelete'] = isDelete;
    data['AddDate'] = addDate;
    data['LastUpdate'] = lastUpdate;
    return data;
  }
}

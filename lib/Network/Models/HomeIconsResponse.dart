class HomeIconsResponse {
  bool? status;
  int? code;
  String? message;
  List<HomeData>? data;

  HomeIconsResponse({this.status, this.code, this.message, this.data});

  HomeIconsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeData>[];
      json['data'].forEach((v) {
        data!.add(HomeData.fromJson(v));
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

class HomeData {
  String? heading;
  List<HomeIconsData>? data;

  HomeData({this.heading, this.data});

  HomeData.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    if (json['data'] != null) {
      data = <HomeIconsData>[];
      json['data'].forEach((v) {
        data!.add(HomeIconsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['heading'] = heading;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeIconsData {
  String? id;
  String? serviceName;
  String? serviceCode;
  String? showServices;
  String? logo;
  String? position;
  String? groupName;
  String? androidGroupName;

  HomeIconsData(
      {this.id,
      this.serviceName,
      this.serviceCode,
      this.showServices,
      this.logo,
      this.position,
      this.groupName,
      this.androidGroupName,
      });

  HomeIconsData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    serviceName = json['ServiceName'];
    serviceCode = json['ServiceCode'];
    showServices = json['ShowServices'];
    logo = json['Logo'];
    position = json['Position'];
    groupName = json['GroupName'];
    androidGroupName = json['AndroidGroupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ServiceName'] = serviceName;
    data['ServiceCode'] = serviceCode;
    data['ShowServices'] = showServices;
    data['Logo'] = logo;
    data['Position'] = position;
    data['GroupName'] = groupName;
    data['AndroidGroupName'] = androidGroupName;
    return data;
  }
}

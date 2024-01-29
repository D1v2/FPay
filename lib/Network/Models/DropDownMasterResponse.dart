class DropDownMasterResponse {
  bool? status;
  int? code;
  String? message;
  List<DropDownMasterData>? data;

  DropDownMasterResponse({this.status, this.code, this.message});

  DropDownMasterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DropDownMasterData>[];
      json['data'].forEach((v) {
        data!.add(DropDownMasterData.fromJson(v));
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

class DropDownMasterData {
  String? id;
  String? name;

  DropDownMasterData({this.id, this.name});

  DropDownMasterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

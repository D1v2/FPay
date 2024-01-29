class RoomInfo {
  RoomInfo({
      this.numberOfAdults, 
      this.numberOfChild, 
      this.childAge,});

  RoomInfo.fromJson(dynamic json) {
    numberOfAdults = json['numberOfAdults'];
    numberOfChild = json['numberOfChild'];
    childAge = json['childAge'] != null ? json['childAge'].cast<int>() : [];
  }
  int? numberOfAdults;
  int? numberOfChild;
  List<int>? childAge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['numberOfAdults'] = numberOfAdults;
    map['numberOfChild'] = numberOfChild;
    map['childAge'] = childAge;
    return map;
  }

}
class Bds {
  Bds({
      this.bt,});

  Bds.fromJson(dynamic json) {
    bt = json['bt'];
  }
  String? bt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bt'] = bt;
    return map;
  }

}
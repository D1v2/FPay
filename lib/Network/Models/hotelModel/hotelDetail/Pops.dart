class Pops {
  Pops({
      this.fc, 
      this.tpc,});

  Pops.fromJson(dynamic json) {
    fc = json['fc'] != null ? json['fc'].cast<String>() : [];
    tpc = json['tpc'];
  }
  List<String>? fc;
  double? tpc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fc'] = fc;
    map['tpc'] = tpc;
    return map;
  }

}
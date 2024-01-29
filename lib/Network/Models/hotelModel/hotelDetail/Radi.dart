import 'Bds.dart';

class Radi {
  Radi({
      this.bds,});

  Radi.fromJson(dynamic json) {
    if (json['bds'] != null) {
      bds = [];
      json['bds'].forEach((v) {
        bds?.add(Bds.fromJson(v));
      });
    }
  }
  List<Bds>? bds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bds != null) {
      map['bds'] = bds?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
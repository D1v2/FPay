import 'Benefit.dart';

class Rexb {
  Rexb({
      this.benefit,});

  Rexb.fromJson(dynamic json) {
    if (json['BENEFIT'] != null) {
      benefit = [];
      json['BENEFIT'].forEach((v) {
        benefit?.add(Benefit.fromJson(v));
      });
    }
  }
  List<Benefit>? benefit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (benefit != null) {
      map['BENEFIT'] = benefit?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
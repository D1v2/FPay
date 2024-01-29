import 'Pd.dart';

class Cnp {
  Cnp({
      this.ifra, 
      this.inra, 
      this.pd,});

  Cnp.fromJson(dynamic json) {
    ifra = json['ifra'];
    inra = json['inra'];
    if (json['pd'] != null) {
      pd = [];
      json['pd'].forEach((v) {
        pd?.add(Pd.fromJson(v));
      });
    }
  }
  bool? ifra;
  bool? inra;
  List<Pd>? pd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ifra'] = ifra;
    map['inra'] = inra;
    if (pd != null) {
      map['pd'] = pd?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
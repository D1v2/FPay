import 'Taf.dart';

class Tafcs {
  Tafcs({
      this.taf,});

  Tafcs.fromJson(dynamic json) {
    taf = json['TAF'] != null ? Taf.fromJson(json['TAF']) : null;
  }
  Taf? taf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (taf != null) {
      map['TAF'] = taf?.toJson();
    }
    return map;
  }

}
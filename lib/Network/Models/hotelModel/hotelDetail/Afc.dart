import 'Taf.dart';

class Afc {
  Afc({
      this.taf,});

  Afc.fromJson(dynamic json) {
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
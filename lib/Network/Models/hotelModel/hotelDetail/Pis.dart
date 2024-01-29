import 'Fc.dart';
import 'Afc.dart';

class Pis {
  Pis({
      this.day, 
      this.tp, 
      this.fc, 
      this.afc,});

  Pis.fromJson(dynamic json) {
    day = json['day'];
    tp = json['tp'];
    fc = json['fc'] != null ? Fc.fromJson(json['fc']) : null;
    afc = json['afc'] != null ? Afc.fromJson(json['afc']) : null;
  }
  int? day;
  double? tp;
  Fc? fc;
  Afc? afc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['tp'] = tp;
    if (fc != null) {
      map['fc'] = fc?.toJson();
    }
    if (afc != null) {
      map['afc'] = afc?.toJson();
    }
    return map;
  }

}
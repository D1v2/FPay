import 'package:fpay/Network/Models/hotelModel/hotelDetail/Inst.dart';

import 'Ris.dart';
import 'Cnp.dart';
import 'Oai.dart';

class Ops {
  Ops({
      this.ris, 
      this.id, 
      this.tp, 
      this.sc, 
      this.roe, 
      this.cnp, 
      this.ddt, 
      this.inst, 
      this.oai, 
      this.iopr, 
      this.ipr, 
      this.omid, 
      this.ipm, 
      this.cpb,});

  Ops.fromJson(dynamic json) {
    if (json['ris'] != null) {
      ris = [];
      json['ris'].forEach((v) {
        ris?.add(Ris.fromJson(v));
      });
    }
    id = json['id'];
    tp = json['tp'];
    sc = json['sc'];
    roe = json['roe'];
    cnp = json['cnp'] != null ? Cnp.fromJson(json['cnp']) : null;
    ddt = json['ddt'];
    if (json['inst'] != null) {
      inst = [];
      json['inst'].forEach((v) {
        inst?.add(Inst.fromJson(v));
      });
    }
    oai = json['oai'] != null ? Oai.fromJson(json['oai']) : null;
    iopr = json['iopr'];
    ipr = json['ipr'];
    omid = json['omid'];
    ipm = json['ipm'];
    cpb = json['cpb'];
  }
  List<Ris>? ris;
  String? id;
  double? tp;
  String? sc;
  double? roe;
  Cnp? cnp;
  String? ddt;
  List<Inst>? inst;
  Oai? oai;
  bool? iopr;
  bool? ipr;
  String? omid;
  bool? ipm;
  int? cpb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ris != null) {
      map['ris'] = ris?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['tp'] = tp;
    map['sc'] = sc;
    map['roe'] = roe;
    if (cnp != null) {
      map['cnp'] = cnp?.toJson();
    }
    map['ddt'] = ddt;
    if (inst != null) {
      map['inst'] = inst?.map((v) => v.toJson()).toList();
    }
    if (oai != null) {
      map['oai'] = oai?.toJson();
    }
    map['iopr'] = iopr;
    map['ipr'] = ipr;
    map['omid'] = omid;
    map['ipm'] = ipm;
    map['cpb'] = cpb;
    return map;
  }

}
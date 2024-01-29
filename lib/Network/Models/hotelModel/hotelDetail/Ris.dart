import 'Tfcs.dart';
import 'Tafcs.dart';
import 'Pis.dart';
import 'Radi.dart';
import 'Rexb.dart';

class Ris {
  Ris({
      this.id, 
      this.rc, 
      this.rt, 
      this.srn, 
      this.adt, 
      this.chd, 
      this.mb, 
      this.tp, 
      this.tfcs, 
      this.tafcs, 
      this.pis, 
      this.checkInDate, 
      this.checkOutDate, 
      this.radi, 
      this.rexb,});

  Ris.fromJson(dynamic json) {
    id = json['id'];
    rc = json['rc'];
    rt = json['rt'];
    srn = json['srn'];
    adt = json['adt'];
    chd = json['chd'];
    mb = json['mb'];
    tp = json['tp'];
    tfcs = json['tfcs'] != null ? Tfcs.fromJson(json['tfcs']) : null;
    tafcs = json['tafcs'] != null ? Tafcs.fromJson(json['tafcs']) : null;
    if (json['pis'] != null) {
      pis = [];
      json['pis'].forEach((v) {
        pis?.add(Pis.fromJson(v));
      });
    }
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
    radi = json['radi'] != null ? Radi.fromJson(json['radi']) : null;
    rexb = json['rexb'] != null ? Rexb.fromJson(json['rexb']) : null;
  }
  String? id;
  String? rc;
  String? rt;
  String? srn;
  int? adt;
  int? chd;
  String? mb;
  double? tp;
  Tfcs? tfcs;
  Tafcs? tafcs;
  List<Pis>? pis;
  String? checkInDate;
  String? checkOutDate;
  Radi? radi;
  Rexb? rexb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['rc'] = rc;
    map['rt'] = rt;
    map['srn'] = srn;
    map['adt'] = adt;
    map['chd'] = chd;
    map['mb'] = mb;
    map['tp'] = tp;
    if (tfcs != null) {
      map['tfcs'] = tfcs?.toJson();
    }
    if (tafcs != null) {
      map['tafcs'] = tafcs?.toJson();
    }
    if (pis != null) {
      map['pis'] = pis?.map((v) => v.toJson()).toList();
    }
    map['checkInDate'] = checkInDate;
    map['checkOutDate'] = checkOutDate;
    if (radi != null) {
      map['radi'] = radi?.toJson();
    }
    if (rexb != null) {
      map['rexb'] = rexb?.toJson();
    }
    return map;
  }

}
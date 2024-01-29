import '../hotelList/Ad.dart';
import '../hotelList/Gl.dart';
import 'Img.dart';
import 'Cnt.dart';
import 'Inst.dart';
import 'Ops.dart';
import 'Pops.dart';

class Hotel {
  Hotel({
      this.id, 
      this.name, 
      this.img, 
      this.des, 
      this.rt, 
      this.gl, 
      this.ad, 
      this.fl, 
      this.pt, 
      this.cnt, 
      this.inst, 
      this.ops, 
      this.pops, 
      this.uid, 
      this.lhc,});

  Hotel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['img'] != null) {
      img = [];
      json['img'].forEach((v) {
        img?.add(Img.fromJson(v));
      });
    }
    des = json['des'];
    rt = json['rt'];
    gl = json['gl'] != null ? Gl?.fromJson(json['gl']) : null;
    ad = json['ad'] != null ? Ad?.fromJson(json['ad']) : null;
    fl = json['fl'] != null ? json['fl'].cast<String>() : [];
    pt = json['pt'];
    cnt = json['cnt'] != null ? Cnt.fromJson(json['cnt']) : null;
    if (json['inst'] != null) {
      inst = [];
      json['inst'].forEach((v) {
        inst?.add(Inst.fromJson(v));
      });
    }
    if (json['ops'] != null) {
      ops = [];
      json['ops'].forEach((v) {
        ops?.add(Ops.fromJson(v));
      });
    }
    if (json['pops'] != null) {
      pops = [];
      json['pops'].forEach((v) {
        pops?.add(Pops.fromJson(v));
      });
    }
    uid = json['uid'];
    lhc = json['lhc'];
  }
  String? id;
  String? name;
  List<Img>? img;
  String? des;
  int? rt;
  Gl? gl;
  Ad? ad;
  List<String>? fl;
  String? pt;
  Cnt? cnt;
  List<Inst>? inst;
  List<Ops>? ops;
  List<Pops>? pops;
  String? uid;
  String? lhc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (img != null) {
      map['img'] = img?.map((v) => v.toJson()).toList();
    }
    map['des'] = des;
    map['rt'] = rt;
    if (gl != null) {
      map['gl'] = gl?.toJson();
    }
    if (ad != null) {
      map['ad'] = ad?.toJson();
    }
    map['fl'] = fl;
    map['pt'] = pt;
    if (cnt != null) {
      map['cnt'] = cnt?.toJson();
    }
    if (inst != null) {
      map['inst'] = inst?.map((v) => v.toJson()).toList();
    }
    if (ops != null) {
      map['ops'] = ops?.map((v) => v.toJson()).toList();
    }
    if (pops != null) {
      map['pops'] = pops?.map((v) => v.toJson()).toList();
    }
    map['uid'] = uid;
    map['lhc'] = lhc;
    return map;
  }

}
import 'Img.dart';
import 'Gl.dart';
import 'Ad.dart';
import 'Pops.dart';

class His {
  His({
      this.id, 
      this.name, 
      this.img, 
      this.rt, 
      this.gl, 
      this.ad, 
      this.pt, 
      this.pops, 
      this.uid, 
      this.lhc,});

  His.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['img'] != null) {
      img = [];
      json['img'].forEach((v) {
        img?.add(Img.fromJson(v));
      });
    }
    rt = json['rt'];
    gl = json['gl'] != null ? Gl.fromJson(json['gl']) : null;
    ad = json['ad'] != null ? Ad.fromJson(json['ad']) : null;
    pt = json['pt'];
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
  int? rt;
  Gl? gl;
  Ad? ad;
  String? pt;
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
    map['rt'] = rt;
    if (gl != null) {
      map['gl'] = gl?.toJson();
    }
    if (ad != null) {
      map['ad'] = ad?.toJson();
    }
    map['pt'] = pt;
    if (pops != null) {
      map['pops'] = pops?.map((v) => v.toJson()).toList();
    }
    map['uid'] = uid;
    map['lhc'] = lhc;
    return map;
  }

}
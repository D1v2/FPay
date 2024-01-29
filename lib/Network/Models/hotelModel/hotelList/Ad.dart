import 'City.dart';
import 'State.dart';
import 'Country.dart';

class Ad {
  Ad({
      this.adr, 
      this.postalCode, 
      this.city, 
      this.state, 
      this.country, 
      this.ctn, 
      this.cn,});

  Ad.fromJson(dynamic json) {
    adr = json['adr'];
    postalCode = json['postalCode'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    ctn = json['ctn'];
    cn = json['cn'];
  }
  String? adr;
  String? postalCode;
  City? city;
  State? state;
  Country? country;
  String? ctn;
  String? cn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adr'] = adr;
    map['postalCode'] = postalCode;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    if (state != null) {
      map['state'] = state?.toJson();
    }
    if (country != null) {
      map['country'] = country?.toJson();
    }
    map['ctn'] = ctn;
    map['cn'] = cn;
    return map;
  }

}
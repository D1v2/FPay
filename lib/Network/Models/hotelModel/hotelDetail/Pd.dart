class Pd {
  Pd({
      this.fdt, 
      this.tdt, 
      this.am,});

  Pd.fromJson(dynamic json) {
    fdt = json['fdt'];
    tdt = json['tdt'];
    am = json['am'];
  }
  String? fdt;
  String? tdt;
  double? am;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fdt'] = fdt;
    map['tdt'] = tdt;
    map['am'] = am;
    return map;
  }

}
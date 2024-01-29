class Cnt {
  Cnt({
      this.ph,});

  Cnt.fromJson(dynamic json) {
    ph = json['ph'];
  }
  String? ph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ph'] = ph;
    return map;
  }

}